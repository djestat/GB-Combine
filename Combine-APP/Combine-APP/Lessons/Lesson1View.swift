//
//  Lesson1View.swift
//  Combine-APP
//
//  Created by Igor on 29.01.2022.
//

import SwiftUI
import Combine

fileprivate var cancellableSet: Set<AnyCancellable> = []

struct CatchesValue: Identifiable {
    let id = UUID()
    let name: String
}

struct Lesson1View: View {
    
    private let notifyCenter = NotificationCenter.default
    
    // MARK: - Combine Elements, Publisher
    private let just = Just<[CatchesValue]>([])
    private let publisher = NotificationCenter.default.publisher(for: .generateStruct, object: nil)
    
    // MARK: - Data sourse
    @State var catchesValues: [CatchesValue] = []
    
    var body: some View {
        VStack {
            Text("Урок 1. .onNext(Combine)")
                .padding()
            HStack {
                Button("Generate Struct") {
                    sendNotifyForGenerateStruct()
                }
                .padding()
                Button("Clear list") {
                    clearList()
                }
                .padding()
            }
            List(catchesValues) { value in
                Text(value.name)
            }
        }
        .onAppear {
            //MARK: - Subscribe
            publisher.sink { notification in
                print("--- notification \(notification.name)")
                let randNumber = Int.random(in: 9..<20)
                addValuesInArray(with: randNumber)
            }.store(in: &cancellableSet)
        }
        .onDisappear {
            //MARK: - UnSubscribe
            cancellableSet.forEach { anyCancellable in
                anyCancellable.cancel()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // MARK: - For Combine Functions
    private func clearList() {
        // Practice for Just
        _ = just.sink { value in
            catchesValues = value
            print("Just worked ", value)
        }
    }
    
    private func sendNotifyForGenerateStruct() {
        notifyCenter.post(name: .generateStruct,
                          object: nil)
    }
    
    // MARK: - Help Functions
    private func addValuesInArray(with randNumber: Int) {

        let randomString = randomString(randNumber)
        let value = CatchesValue(name: randomString)
        catchesValues.append(value)
    }
    
    private func randomString(_ randNumber: Int) -> String {
        let string = String.random(length: randNumber)
        return string
    }
}

struct Lesson1View_Previews: PreviewProvider {
    static var previews: some View {
        Lesson1View()
    }
}
