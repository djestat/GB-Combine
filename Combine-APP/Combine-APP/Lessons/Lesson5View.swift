//
//  Lesson5View.swift
//  Combine-APP
//
//  Created by Igor on 12.02.2022.
//

import SwiftUI
import Combine

struct Lesson5View: View {
    
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
