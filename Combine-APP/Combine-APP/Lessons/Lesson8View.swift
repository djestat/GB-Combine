//
//  Lesson8View.swift
//  Combine-APP
//
//  Created by Igor on 12.02.2022.
//

import SwiftUI
import Combine

struct Lesson8View: View {
    
    @State var catchesValues: [CatchesValue] = []
    
    var body: some View {
        VStack{
            Text("Урок 8. Тестирование Combine-кода")
                .font(.headline)

        }
        .navigationBarTitleDisplayMode(.inline)
    }
    
}

struct Lesson8View_Previews: PreviewProvider {
    static var previews: some View {
        Lesson8View()
    }
}
