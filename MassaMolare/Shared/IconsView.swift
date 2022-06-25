//
//  IconsView.swift
//  MassaMolare
//
//  Created by Luca Vigato on 02/05/22.
//

import SwiftUI

struct IconsView: View {
    
    @EnvironmentObject var iconSettings: IconNames
    private var twoColumnGrid = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        //NavigationView {
            ScrollView {
                LazyVGrid(columns: twoColumnGrid, spacing: 8) {
                    ForEach(0..<iconSettings.iconNames.count, id: \.self) { index in
                        VStack {
                            Image(uiImage: UIImage(named: iconSettings.iconNames[index] ?? "AppIcon60x60") ?? UIImage())
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 120, height: 120)
                                .cornerRadius(10)
                                .scaledToFit()
                                .onTapGesture {
                                    let value = index
                                    let mindex = self.iconSettings.iconNames.firstIndex(of: UIApplication.shared.alternateIconName) ?? 0
                                    
                                    if mindex != value {
                                        UIApplication.shared.setAlternateIconName(self.iconSettings.iconNames[index]) { error in
                                            if let error = error {
                                                print(error.localizedDescription)
                                            } else {
                                                print("Successfully AppIcon is Changed")
                                            }
                                        }
                                    }
                                }
                            Text("\(iconSettings.iconNames[index]?.capitalized ?? "Default")")
                        }
                        .padding()
                    }
                }
                .padding()
            }
          //  .navigationBarTitle("Dynamic Icons")
        //}
    }
}

struct IconsView_Previews: PreviewProvider {
    static var previews: some View {
        IconsView()
    }
}
