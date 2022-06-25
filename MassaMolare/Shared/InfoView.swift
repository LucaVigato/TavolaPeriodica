//
//  InfoView.swift
//  MassaMolare
//
//  Created by Luca Vigato on 15/04/22.
//

import SwiftUI

struct InfoView: View {
    
    @State private var searchText = ""
    
    var elementi: [String] = ["H", "He", "Li", "Be", "B", "C", "N", "O", "F", "Ne", "Na", "Mg", "Al", "Si", "P", "S", "Cl",
                              "Ar", "K", "Ca", "Sc", "Ti", "V", "Cr", "Mn", "Fe", "Co", "Ni", "Cu", "Zn", "Ga", "Ge", "As",
                              "Se", "Br", "Kr", "Rb", "Sr", "Y", "Zr", "Nb", "Mo", "Tc", "Ru", "Rh", "Pd", "Ag", "Cd", "In",
                              "Sn", "Sb", "Te", "I", "Xe", "Cs", "Ba", "La", "Ce", "Pr", "Nd", "Pm", "Sm", "Eu", "Gd", "Tb",
                              "Dy", "Ho", "Er", "Tm", "Yb", "Lu", "Hf", "Ta", "W", "Re", "Os", "Ir", "Pt", "Au", "Hg", "Tl",
                              "Pb", "Bi", "Po", "At", "Rn", "Fr", "Ra", "Ac", "Th", "Pa", "U", "Np", "Pu", "Am", "Cm", "Bk",
                              "Cf", "Es", "Fm", "Md", "No", "Lr", "Rf", "Db", "Sg", "Bh", "Hs", "Mt", "Ds", "Rg", "Cn", "Nh",
                              "Fl", "Mc", "Lv", "Ts", "Og"]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(searchResult, id: \.self) { name in
                    NavigationLink(destination: DetailView(elemento: name)) {
                        ZStack {
                            Text(name)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text("\(El.init(n: name).info(n: name).1)")
                                .frame(maxWidth: .infinity, alignment: .center)
                        }
                    }
                }
            }
            .searchable(text: $searchText) {
                ForEach(searchResult, id: \.self) { result in
                    Text(result)
                        .searchCompletion(result)
                }
            }
            .disableAutocorrection(true)
            .navigationTitle("informazioni")
        }
    }
    
    var searchResult: [String] {
        if searchText.isEmpty {
            return elementi
        }
        else
        {
            return elementi.filter { $0.contains(searchText) }
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
            .previewInterfaceOrientation(.portrait)
    }
}
