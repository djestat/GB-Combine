//
//  Lesson3View.swift
//  Combine-APP
//
//  Created by Igor on 12.02.2022.
//

import SwiftUI
import Combine

fileprivate var subscriptions: Set<AnyCancellable> = []
fileprivate var timerBug: Set<AnyCancellable> = []

struct Lesson3View: View {
        
    @State var catchesValues: [CatchesValue] = []
    @State var textFieldString: String = ""
    @State var isStarted: Bool = false

    private let textPublisher = PassthroughSubject<String, Never>()
    private let integerPublisher = PassthroughSubject<Int, Never>()
    private let mergedPublisher = PassthroughSubject<String, Never>()

    var body: some View {
        ScrollView {
            VStack {
                Text("Урок 3. Операторы. Часть 2")
                    .font(.headline)
                    .padding()
                Text("Состояние: \(isStarted ? "Слушаю" : "Не слушаю")")
                    .foregroundColor(isStarted ? .green : .red)
                    .font(.headline)
                Spacer().frame(height: 10)
                Button("\(!isStarted ? "Слушать" : "Не слушать")") {
                    startStopPublisher()
                }
            }
            Spacer().frame(height: 10)
            HStack {
                Text("Результаты ")
                    .padding(.trailing, 30)
                Button("Очистить") {
                    catchesValues.removeAll()
                }
            }
            .padding()
            List(catchesValues) { value in
                Text(value.name)
            }.frame(height: 350)
        }
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            subscribeTextPublisher()
        }
    }
    
    private func startStopPublisher() {
        isStarted = !isStarted
        if isStarted {
            Timer.publish(every: 0.12, on: .main, in: .common)
                .autoconnect()
                .sink { seconds in
                    let randNumber = Int.random(in: 3..<20)
                    let string = String.random(length: randNumber)
                    textPublisher.send(string)
                    //print("Seconds: \(seconds): String \(unicode)")
                }
                .store(in: &timerBug)
            
            Timer.publish(every: 0.09, on: .main, in: .common)
                .autoconnect()
                .sink { seconds in
                    let code1 = Int.random(in: 0...0xD7FF)
                    let code2 = Int.random(in: 0xE000...0x10FFFF)
                    let boolRand = Bool.random()
                    let code = boolRand ? code1 : code2
                    integerPublisher.send(code)
                    //print("Seconds: \(seconds): code \(code)")
                }
                .store(in: &timerBug)
        } else {
            timerBug.removeAll()
        }
    }
    
    private func subscribeTextPublisher() {
        
        let queue = DispatchQueue(label: "Collect")
        textPublisher
            .collect(.byTime(queue, .seconds(0.5)))
            .map({ $0.reduce("", { $0 + $1} )
            })
            .sink { value in
                print(value)
            }.store(in: &subscriptions)
        
        integerPublisher
            .map({ value in
                value.description + value.description
            })
            .sink { value in
                print(value)
            }.store(in: &subscriptions)
     
        textPublisher
            .zip(integerPublisher)
            .map({ value in
                value.0.hashValue + value.1
            })
            .map({ result -> String in
                let code1 = 0...0xD7FF
                let code2 = 0xE000...0x10FFFF
                
                let code = code1.contains(result) ? result : code2.contains(result) ? result : 0
                return "\(code)".unicodeScalars.description
            })
            .collect(.byTime(queue, .seconds(0.9)))
            .sink { value in
                if catchesValues.count == 5 {
                    catchesValues.removeFirst()
                }
                catchesValues.append(CatchesValue(name: value.description))
                print(value)
            }.store(in: &subscriptions)
            
       
    }
    
}

struct Lesson3View_Previews: PreviewProvider {
    static var previews: some View {
        Lesson3View()
    }
}
