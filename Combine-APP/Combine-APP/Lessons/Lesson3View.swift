//
//  Lesson3View.swift
//  Combine-APP
//
//  Created by Igor on 12.02.2022.
//

import SwiftUI
import Combine

struct Lesson3View: View {
        
    @State var catchesValues: [CatchesValue] = []
    
    var body: some View {
        VStack{
            Text("Урок 3. Операторы. Часть 2")
            
        }
        .navigationBarTitleDisplayMode(.inline)
    }
    
}

struct Lesson3View_Previews: PreviewProvider {
    static var previews: some View {
        Lesson3View()
    }
}
