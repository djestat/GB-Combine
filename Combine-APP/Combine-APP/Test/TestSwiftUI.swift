//
//  TestSwiftUI.swift
//  Combine-APP
//
//  Created by Igor on 02.02.2022.
//

import SwiftUI
import Combine
import MapKit

let spacing: CGFloat = 24


struct SettingsValue: Identifiable {
    var id: UUID = UUID()
    let name: String
    let icon: String
}

struct TestSwiftUI: View {
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))

    @State var array: [SettingsValue] = [SettingsValue(name: "Avia",
                                                       icon: "antenna.radiowaves.left.and.right.slash"),
                                         SettingsValue(name: "Wifi",
                                                       icon: "wifi"),
                                         SettingsValue(name: "Bluetooth",
                                                       icon: "wave.3.forward.circle"),
                                         SettingsValue(name: "Cellular",
                                                       icon: "antenna.radiowaves.left.and.right")]
    
    var body: some View {
        VStack {
            HStack (alignment: .center, spacing: spacing) {
                Button("Clear") {
                    array.removeAll()
                }.padding()
                Button("+") {
                    array.append(SettingsValue(name: "Charge",
                                               icon: "bolt"))
                }.padding()
            }
            List(array) { value in
                //Text(value.name).bold()
                HStack (alignment: .center, spacing: spacing) {
                    Image(systemName: value.icon)
                    Button(value.name) {
                        array.append(value)
                    }
                }
                
            }.frame(height: 250)
            ZStack(alignment: .top) {
                Map(coordinateRegion: $region)
                HStack (alignment: .center, spacing: spacing) {
                    Text("London")
                    Text("London")
                    Text("London")
                }
            }
            
        }
    }
    
}

struct TestSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        TestSwiftUI()
    }
}
