//
//  Lesson7View.swift
//  Combine-APP
//
//  Created by Igor on 12.02.2022.
//

import SwiftUI
import Combine

struct Lesson7View: View {

    @State var catchesValues: [CatchesValue] = []
    
    var body: some View {
        VStack{
            Text("Урок 7. SwiftUI + Combine")
                .font(.headline)

        }
        .navigationBarTitleDisplayMode(.inline)
    }
    
}

struct Lesson7View_Previews: PreviewProvider {
    static var previews: some View {
        Lesson7View()
    }
}
