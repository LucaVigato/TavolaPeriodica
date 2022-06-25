//
//  MainView.swift
//  MassaMolare
//
//  Created by Luca Vigato on 13/04/22.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            
            TableView()
                .tabItem {
                    Label("tavola", systemImage: "table")
                }
            
            Calcoli()
                .tabItem {
                    Label("calcoli", systemImage: "plus.forwardslash.minus")
                }
            
            InfoView()
                .tabItem {
                    Label("Info", systemImage: "info")
                }
            
            SettingsView()
                .environmentObject(IconNames())
                .tabItem {
                    Label("impostazioni", systemImage: "gear")
                }
        }
    }
}

class IconNames: ObservableObject {
    
    var iconNames: [String?] = [nil]
    @Published var currentIndex = 0
    
    init() {
        getAlternateIcons()
        
        if let currentIcon = UIApplication.shared.alternateIconName {
            self.currentIndex = iconNames.firstIndex(of : currentIcon) ?? 0
        }
    }
    
    func getAlternateIcons() {
        if let icons = Bundle.main.object(forInfoDictionaryKey: "CFBundleIcons") as? [String: Any],
           let alternateIcons = icons["CFBundleAlternateIcons"] as? [String: Any] {
            
            for(_, value) in alternateIcons {
                guard let iconList = value as? Dictionary<String, Any> else {return}
                guard let iconFiles = iconList["CFBundleIconFiles"] as? [String] else {return}
                guard let icon = iconFiles.first else {return}
                
                iconNames.append(icon)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
