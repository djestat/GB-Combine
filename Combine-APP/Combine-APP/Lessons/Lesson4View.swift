//
//  Lesson4View.swift
//  Combine-APP
//
//  Created by Igor on 12.02.2022.
//

import SwiftUI
import Combine

fileprivate var subscriptions: Set<AnyCancellable> = []


struct Lesson4View: View {
    
    @State private var textFieldString = ""
    @State private var dataSource: [AnyModel] = []
    
    @State private var viewModel = ViewModel()
    
    var body: some View {
        ScrollView {
            VStack{
                Text("Урок 4. Работа с сетью и отладка")
                    .font(.headline)
                Spacer().frame(height: 30)
                TextField("Номера через запятую", text: $textFieldString)
                    .padding(.all, 10)
                Picker("Поиск по:", selection: $viewModel.selectedIndex, content: {
                    Text("People").tag(0)
                    Text("Planet").tag(1)
                    Text("Starship").tag(2)
                })
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                HStack {
                    Group {
                        Text(viewModel.typeDescription())
                            .padding(.trailing, 30)
                        Button("Загрузить") {
                            loadData()
                        }
                        .padding(.trailing, 30)

                        Button("Очистить") {
                            viewModel.clearDataSouce()
                            textFieldString.removeAll()
                        }
                    }
                }
                .padding()
                List(dataSource) { value in
                    Text(value.description())
                        .foregroundColor(.green)
                }.frame(height: 400)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            subscribe()
            loadData()
        }
    }
    
    
    private func subscribe() {
        viewModel.dataSource.publisher
            .collect()
            .sink { output in
                dataSource = output
            }
            .store(in: &subscriptions)
    }
    
    private func loadData() {
        let textFieldPublisher = textFieldString.publisher
        
        textFieldPublisher
            .collect()
            .map({ String($0) })
            .map({ Int($0) ?? 1 })
            .print("Body -----")
            .sink { value in
                viewModel.getSourseByType(with: value)
            }.store(in: &subscriptions)
    }
    
}

struct Lesson4View_Previews: PreviewProvider {
    static var previews: some View {
        Lesson4View()
    }
}

/*
1. Написать простейший клиент, который обращается к любому открытому API, используя Combine в запросах. (Минимальное количество методов API: 2).
2. Реализовать отладку любых двух издателей в коде.
*/
