//
//  Lesson2View.swift
//  Combine-APP
//
//  Created by Igor on 12.02.2022.
//

import SwiftUI
import Combine

fileprivate var subscriptions: Set<AnyCancellable> = []

struct NumberValue: Identifiable {
    let id = UUID()
    let value: String
}

struct Lesson2View: View {
    
    @State var catchesValues: [NumberValue] = []
    
    @State var mathString: String = ""
    @State var middleValue: Double = 0

    var body: some View {
        ScrollView {
            VStack {
                Text("Урок 2. Операторы. Часть 1")
                    .font(.headline)
                    .padding()
                Button("Опубликовать коллекцию") {
                    publihsCollection()
                }
                .padding()
                List(catchesValues) { value in
                    Text(value.value)
                }.frame(height: 300)
            }
            Spacer().frame(height: 30)
            TextField("Введите числа через запятую", text: $mathString)
                .padding()
            Text("Среднее: \(middleValue)")
                .padding()
            Button("Расчитать среднее арифметическое") {
                calculateString()
            }.padding()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func publihsCollection() {
        let numbers = (1...100).publisher
        
        numbers
            .drop(while: { $0 % 50 != 0 })
            .filter { $0 % 2 == 0 }
            .collect(20)
            .filter { $0.count == 20 }
            .sink(receiveValue: { value in
                print(value)
                let newElemant = NumberValue(value: value.description)
                catchesValues.append(newElemant)
            })
            .store(in: &subscriptions)
        
    }
    
    private func calculateString() {
        middleValue = 0
        
        let stringPublisher = mathString
            .components(separatedBy: ",")
            .publisher
        
        stringPublisher
            .filter { Double($0) != nil }
            .map { Double($0) ?? Double(0) }
            .collect()
            .map({ $0.reduce(0.0, {$0 + $1}) / Double($0.count)})
            .sink(receiveValue: { value in
                print(value)
                middleValue = value
            })
            .store(in: &subscriptions)
    }
}

struct Lesson2View_Previews: PreviewProvider {
    static var previews: some View {
        Lesson2View()
    }
}

/*
1. Создайте пример, который публикует коллекцию чисел от 1 до 100, и используйте операторы фильтрации, чтобы выполнить следующие действия:

Пропустите первые 50 значений, выданных вышестоящим издателем.
Возьмите следующие 20 значений после этих первых 50.
Берите только чётные числа.
2. Создайте пример, который собирает коллекцию строк, преобразует её в коллекцию чисел и вычисляет среднее арифметическое этих значений.
3. *Создать поиск телефонного номера в коллекции с помощью операторов преобразования. Ваша цель в этой задаче — создать издателя, который делает две вещи:
Получает строку из десяти цифр или букв.
Ищет этот номер в структуре данных контактов.
*/
