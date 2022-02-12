//
//  Lesson4View.swift
//  Combine-APP
//
//  Created by Igor on 12.02.2022.
//

import SwiftUI
import Combine

struct Lesson4View: View {
    
    @State var catchesValues: [CatchesValue] = []
    
    var body: some View {
        VStack{
            Text("Урок 4. Работа с сетью и отладка")

        }
        .navigationBarTitleDisplayMode(.inline)
    }
    
}

struct Lesson4View_Previews: PreviewProvider {
    static var previews: some View {
        Lesson4View()
    }
}
