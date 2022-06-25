//
//  SettingsView.swift
//  MassaMolare
//
//  Created by Luca Vigato on 23/04/22.
//

import SwiftUI
import AdSupport

struct SettingsView: View {
    @EnvironmentObject var iconSettings : IconNames
    
    var body: some View {
        NavigationView {
            Form {
                ZStack {
                    Text("info")
                }
                NavigationLink(destination: IconsView()) {
                    Text("icon")
                }
                ZStack {
                    Text("supporto")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("luca.vigato1@icloud.com")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
            }
            .navigationTitle("impostazioni")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(IconNames())
    }
}
