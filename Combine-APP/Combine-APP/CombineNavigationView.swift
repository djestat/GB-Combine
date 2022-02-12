//
//  CombineNavigationView.swift
//  Combine-APP
//
//  Created by Igor on 29.01.2022.
//

import SwiftUI

struct Lesson: Identifiable {
    let id = UUID()
    let name: String
    let selection: String
    let destination: AnyView
}

struct CombineNavigationView: View {
    
    @State private var selection: String? = nil
    
    private let lessons: [Lesson] = [Lesson(name: "Урок 1. .onNext(Combine)",
                                            selection: "onNext",
                                            destination: AnyView(Lesson1View())),
                                     Lesson(name: "Урок 2. Операторы. Часть 1",
                                            selection: "Operators1",
                                            destination: AnyView(Lesson2View())),
                                     Lesson(name: "Урок 3. Операторы. Часть 2",
                                            selection: "Operators2",
                                            destination: AnyView(Lesson3View())),
                                     Lesson(name: "Урок 4. Работа с сетью и отладка",
                                            selection: "Network",
                                            destination: AnyView(Lesson4View())),
                                     Lesson(name: "Урок 5. KVO, Timers, Resource management",
                                            selection: "KVO",
                                            destination: AnyView(Lesson5View())),
                                     Lesson(name: "Урок 6. Продвинутый Combine",
                                            selection: "Advanced",
                                            destination: AnyView(Lesson6View())),
                                     Lesson(name: "Урок 7. SwiftUI + Combine",
                                            selection: "SwiftUI",
                                            destination: AnyView(Lesson7View())),
                                     Lesson(name: "Урок 8. Тестирование Combine-кода",
                                            selection: "CodeTesting",
                                            destination: AnyView(Lesson8View()))]

    var body: some View {
        NavigationView {
            List(lessons) { value in
                NavigationLink(destination: value.destination,
                               tag: value.selection,
                               selection: $selection) {
                    Button(value.name) {
                        self.selection = value.selection
                    }.padding()
                }
            }
            .navigationTitle("Framework Combine")
        }
    }
}

struct CombineNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        CombineNavigationView()
    }
}
