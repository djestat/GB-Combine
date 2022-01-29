//
//  CombineNavigationView.swift
//  Combine-APP
//
//  Created by Igor on 29.01.2022.
//

import SwiftUI

struct CombineNavigationView: View {
    @State private var selection: String? = nil

    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: CombineView(),
                               tag: "onNext",
                               selection: $selection) { EmptyView() }
                NavigationLink(destination: Text("Operators View"),
                               tag: "Operators",
                               selection: $selection) { EmptyView() }
                Button("Урок 1. .onNext(Combine)") {
                    self.selection = "onNext"
                }.padding()
                Button("Урок 2. Операторы. Часть 1") {
                    self.selection = "Operators"
                }
            }
            .navigationTitle("Framework Combine")
        }
    }
}
