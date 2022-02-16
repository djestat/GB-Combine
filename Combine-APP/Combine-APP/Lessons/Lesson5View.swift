//
//  Lesson5View.swift
//  Combine-APP
//
//  Created by Igor on 12.02.2022.
//

import SwiftUI
import Combine

fileprivate var subscriptions: Set<AnyCancellable> = []

class ObservedString: ObservableObject {
    var value: String = ""
}

struct Lesson5View: View {
    
    //@ObservedObject private var observedString = ObservedString()
    @State var catchesValues: [CatchesValue] = []
    
    var body: some View {
        VStack{
            Text("Урок 5. KVO, Timers, Resource management")
                .font(.headline)

        }
        .navigationBarTitleDisplayMode(.inline)
    }
    
}

struct Lesson5View_Previews: PreviewProvider {
    static var previews: some View {
        Lesson5View()
    }
}


/*
1. Реализовать таймер, который задаёт периодичность обновления данных.

2. Реализовать ObservableObject (ViewModel), который использует ApiClient с прошлого урока для загрузки данных.

3. Использовать операторы .shared() или .multicast() для оптимизации получения данных несколькими подписчиками.
*/
