//
//  PHView.swift
//  MassaMolare
//
//  Created by Luca Vigato on 23/06/22.
//

import SwiftUI

struct TamponeView: View {
    
    @State var constAcid: String = ""
    @State var acid: String = ""
    @State var salt: String = ""
    
    var ph: Double {
        let formatter = NumberFormatter()
        let const: Double = formatter.number(from: constAcid)?.doubleValue ?? 0
        let acido: Double = formatter.number(from: acid)?.doubleValue ?? 0
        let sale: Double = formatter.number(from: salt)?.doubleValue ?? 0
        
        return -log10(const * (acido / sale))
    }
    
    var body: some View {
        Form {
            Section("Input") {
                ZStack {
                    Text("K ionizzazione")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    TextField("Es. 0,0000015", text: $constAcid)
                    .keyboardType(.decimalPad)
                }
                ZStack {
                    Text("M acido")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    TextField("Es. 0,050", text: $acid)
                        .keyboardType(.decimalPad)
                }
                ZStack {
                    Text("M sale")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    TextField("Es. 0.075", text: $salt)
                        .keyboardType(.decimalPad)
                }
            }
            Section("Risultato") {
                Text(ph, format: .number)
            }
        }
    }
}

struct PHView: View {
    
    @State var concentrazione: String = ""
    
    var ph: Double {
        let formatter = NumberFormatter()
        let conc: Double = formatter.number(from: concentrazione)?.doubleValue ?? 0
        
        return -log10(conc)
    }
    
    var body: some View {
        Form {
            Section("Input") {
                ZStack {
                    Text("M H+")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    TextField("Concentrazione di ioni H+", text: $concentrazione)
                        .keyboardType(.decimalPad)
                }
            }
            Section("Risultato") {
                Text(ph, format: .number)
            }
        }
    }
}

struct TamponeView_Previews: PreviewProvider {
    static var previews: some View {
        TamponeView()
    }
}
