//
//  Calcoli.swift
//  MassaMolare
//
//  Created by Luca Vigato on 18/06/22.
//

import SwiftUI

struct Calcoli: View {
    var body: some View {
        NavigationView {
            Form {
                NavigationLink(destination: MassaMolare()) {
                    Text("Massa molare")
                }
                NavigationLink(destination: PaulingView()) {
                    Text("Elettronegatività")
                }
                NavigationLink(destination: {
                    Form {
                        NavigationLink(destination: ConvertMassView()) {
                            Text("Massa")
                        }
                        NavigationLink(destination: ConvertLengthView()) {
                            Text("Lunghezza")
                        }
                        NavigationLink(destination: ConvertEnergyView()) {
                            Text("Energia")
                        }
                        NavigationLink(destination: ConvertPressionView()) {
                            Text("Pressione")
                        }
                        NavigationLink(destination: ConvertTempView()) {
                            Text("Temperatura")
                        }
                    }
                }) {
                    Text("Conversioni")
                }
                NavigationLink(destination: TamponeView()) {
                    Text("pH da soluzione tampone")
                }
                NavigationLink(destination: PHView()) {
                    Text("pH")
                }
            }
            .navigationTitle("Calcoli")
        }
    }
}

struct MassaMolare: View {
    
    @State var testo: Bool = false
    
    var body: some View {
        ZStack {
            Button {
                testo = !testo
            } label: {
                Image(systemName: "arrow.left.arrow.right")
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            if (testo) {
                TextView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            }
            else {
                MassaView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            }
        }
    }
}

struct Calcoli_Previews: PreviewProvider {
    static var previews: some View {
            Calcoli()
    }
}
