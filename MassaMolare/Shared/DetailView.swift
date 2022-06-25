//
//  DetailView.swift
//  MassaMolare
//
//  Created by Luca Vigato on 19/04/22.
//

import SwiftUI

struct DetailView: View {

    var elemento: String = ""
    
    var dimensione: CGFloat = UIScreen.main.bounds.height / 7
    
    @State var isShowing = false
    
    var descrizione: String {
        var toReturn = ""
        
        switch El.init(n: elemento).info(n: elemento).4 {
        case "Metalli alcalini":
            toReturn = "I metalli alcalini sono ..."
        case "Metalli alcalino terrosi":
            toReturn = "I metalli alcalino terrosi sono ..."
        case "Metalli del blocco p":
            toReturn = "I metalli del blocco p sono ..."
        case "Metalli del blocco d":
            toReturn = "I metalli del blocco d sono ..."
        case "Semimetalli":
            toReturn = "I semimetalli sono ..."
        case "Non metalli":
            toReturn = "I non metalli sono ..."
        case "Alogeni":
            toReturn = "Gli alogeni sono ..."
        case "Gas nobili":
            toReturn = "I gas nobili sono ..."
        default:
            toReturn = "Provaaaaaaa"
        }
        
        return toReturn
    }
    
    var body: some View {
        VStack {
            Form {
                Section {
                    ZStack {
                        ZStack {
                            Elemento()
                                .stroke(.black, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                                .frame(width: dimensione, height: dimensione, alignment: .center)
                                .zIndex(1)
                                
                            Text("\(elemento)")
                                .foregroundColor(.black)
                                .font(.system(size: dimensione + (calcDim(dim: dimensione) * 5)))
                                .fontWeight(.bold)
                                .frame(width: dimensione, height: dimensione, alignment: .center)
                                .zIndex(1)
                                .offset(x: calcDim(dim: dimensione), y: calcDim(dim: dimensione))
                            Elemento()
                                .fill(defaultColor(blocco: El.init(n: elemento).info(n: elemento).4))
                                .frame(width: dimensione, height: dimensione, alignment: .center)
                            
                        }
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        Text("\(El.init(n: elemento).info(n: elemento).1)")
                            .font(.largeTitle)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                        VStack {
                            Button("\(El.init(n: elemento).info(n: elemento).4)") {
                                isShowing = !isShowing
                            }
                            .popover(isPresented: $isShowing) {
                                Text("\(descrizione)")
                            }
                            .foregroundColor(.primary)
                            .padding()
                            .background(.gray)
                            .cornerRadius(5)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                            
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                    }
                    .padding(.vertical)
                }
            
            
                Section(header: Text("Generale")) {
                    Text("numero-atomico \(El.init(n: elemento).info(n: elemento).3, format: .number)")
                    Text("classe \(El.init(n: elemento).info(n: elemento).4)")
                    Text("gruppo \(El.init(n: elemento).info(n: elemento).10)")
                    Text("periodo \(El.init(n: elemento).info(n: elemento).11)")
                }
            
                Section(header: Text("Info")) {
                    Text("massa-molare \(El.init(n: elemento).info(n: elemento).0, format: .number)")
                    Text("n-o \(El.init(n: elemento).info(n: elemento).2)")
                    Text("configurazione \(El.init(n: elemento).info(n: elemento).5)")
                    Text("el-neg \(El.init(n: elemento).info(n: elemento).6, format: .number)")
                    Text("satp \(El.init(n: elemento).info(n: elemento).7)")
                    Text("fusione \(El.init(n: elemento).info(n: elemento).8)")
                    Text("ebolli \(El.init(n: elemento).info(n: elemento).9)")
                    Text("density \(El.init(n: elemento).info(n: elemento).13, format: .number)")
                }
            
                Section(header: Text("Altro")) {
                    Text(El.init(n: elemento).info(n: elemento).12 ? "\(Image(systemName: "exclamationmark.triangle")) radio" : "nradio")
                }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
