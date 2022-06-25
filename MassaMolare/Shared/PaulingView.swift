//
//  PaulingView.swift
//  MassaMolare
//
//  Created by Luca Vigato on 29/04/22.
//

import SwiftUI

struct PaulingView: View {
    
    @State var diff: Double = 0
    @State var text1: String = ""
    @State var text2: String = ""
    @State private var searchText = ""
    @State var informazioni = false
    
    var elementi: [String] = ["H", "He", "Li", "Be", "B", "C", "N", "O", "F", "Ne", "Na", "Mg", "Al", "Si", "P", "S", "Cl",
                              "Ar", "K", "Ca", "Sc", "Ti", "V", "Cr", "Mn", "Fe", "Co", "Ni", "Cu", "Zn", "Ga", "Ge", "As",
                              "Se", "Br", "Kr", "Rb", "Sr", "Y", "Zr", "Nb", "Mo", "Tc", "Ru", "Rh", "Pd", "Ag", "Cd", "In",
                              "Sn", "Sb", "Te", "I", "Xe", "Cs", "Ba", "La", "Ce", "Pr", "Nd", "Pm", "Sm", "Eu", "Gd", "Tb",
                              "Dy", "Ho", "Er", "Tm", "Yb", "Lu", "Hf", "Ta", "W", "Re", "Os", "Ir", "Pt", "Au", "Hg", "Tl",
                              "Pb", "Bi", "Po", "At", "Rn", "Fr", "Ra", "Ac", "Th", "Pa", "U", "Np", "Pu", "Am", "Cm", "Bk",
                              "Cf", "Es", "Fm", "Md", "No", "Lr", "Rf", "Db", "Sg", "Bh", "Hs", "Mt", "Ds", "Rg", "Cn", "Nh",
                              "Fl", "Mc", "Lv", "Ts", "Og"]
    
    var body: some View {
        VStack {
            ZStack {
                Button(action: {
                        informazioni = !informazioni
                    }) {
                        Image(systemName: "info.circle")
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                Text("elment")
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                    .padding()
                    .opacity(informazioni ? 1 : 0)
                    .animation(Animation.linear, value: informazioni)
                VStack {
                    
                    Button("Reset", action: {
                        text1 = ""
                        text2 = ""
                    })
                    
                    HStack {
                        Menu(text1 == "" ? "Element" : text1) {
                            ForEach(elementi, id: \.self) { name in
                                Button("\(name)", action: {
                                    text1 = name
                                })
                            }
                        }
                        .padding()
                        Image(systemName: "minus")
                        Menu(text2 == "" ? "Element" : text2) {
                            ForEach(elementi, id: \.self) { name in
                                Button("\(name)", action: {
                                    text2 = name
                                })
                            }
                        }
                        .padding()
                    }
                    Text("differenza \(abs(El.init(n: text1).info(n: text1).6 - El.init(n: text2).info(n: text2).6), format: .number)")
                        .padding()
                    if (abs(El.init(n: text1).info(n: text1).6 - El.init(n: text2).info(n: text2).6) != 0) {
                        Text(abs(El.init(n: text1).info(n: text1).6 - El.init(n: text2).info(n: text2).6) >= 1.9 ? "legame-ionico" : "legame-covalente")
                    }
                }
            }
        }
    }
}

struct PaulingView_Previews: PreviewProvider {
    static var previews: some View {
        PaulingView()
    }
}
