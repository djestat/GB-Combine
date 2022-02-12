//
//  Lesson6View.swift
//  Combine-APP
//
//  Created by Igor on 12.02.2022.
//

import SwiftUI
import Combine

struct Lesson6View: View {
    
    @State var catchesValues: [CatchesValue] = []
    
    var body: some View {
        VStack{
            Text("Урок 6. Продвинутый Combine")
            
        }
        .navigationBarTitleDisplayMode(.inline)
    }
    
}

struct Lesson6View_Previews: PreviewProvider {
    static var previews: some View {
        Lesson6View()
    }
}
