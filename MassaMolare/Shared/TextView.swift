//
//  TextView.swift
//  MassaMolare
//
//  Created by Luca Vigato on 13/04/22.
//

import SwiftUI

struct TextView: View {
    
    @State var elemento: String = ""
    @State var somma: Double = 0
    @State var formula: String = ""
    @State var j: Int = 0
    @State var sommaString: String = ""
    @State var informazioni = false
    
    var body: some View {
        VStack {
            ZStack {
                Button(action: {
                        informazioni = !informazioni
                    }) {
                        Image(systemName: "info.circle")
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                
                Text("maiuscole")
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                    .padding()
                    .opacity(informazioni ? 1 : 0)
                    .animation(Animation.linear, value: informazioni)
                VStack {
                    Text("massa-molare \(somma, format: .number)")
                    TextField("elemento", text: $elemento)
                        .padding()
                        .disableAutocorrection(true)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .onSubmit {
                            somma = 0
                            let strArr = Array(elemento)
                            let len = strArr.count
                            var vecchiaStr = ""
                            var intStr = ""
                            var intNVolte = ""
                            var j = len - 1
                            var semiSomma: Double = 0
                            while (j >= 0) {
                                /*
                                 Controlla subito se c'è un numero alla fine, così più avanti può effettivamente moltiplicare per l'indice
                                 */
                                if (Int(String(strArr[j])) != nil) { // doppio casting per convertire il numero
                                    intStr = String(strArr[j]) + intStr
                                }
                                /*
                                 Se la lettera attuale è maiuscola e la stringa che viene dopo è minuscola {
                                 sommaString = Lettera maiuscola attuale + lettera assegnata più avanti per tenere le lettere minuscole
                                 aggiungi al valore della somma la massa molare dell'elemento sommaString
                                 resetta sommaString
                                 }
                                 */
                                if (strArr[j].isUppercase && (strArr[(j + 1 < len ? j + 1 : j)].isLowercase)) {
                                    sommaString = String(strArr[j]) + vecchiaStr
                                    somma += El.init(n: sommaString).info(n: sommaString).0
                                    sommaString = ""
                                }
                                /*
                                 Se la lettera attuale è maiuscola e la lettera successiva è maiuscola, siccome la lettera successiva è gia stata aggiunta alla somma, aggiungi alla somma solamente la lettera maiuscola attuale
                                 */
                                else if (strArr[j].isUppercase && (strArr[(j + 1 < len ? j + 1 : j)].isUppercase || strArr[(j + 1 < len ? j + 1 : j)] == ")")) {
                                    somma += El.init(n: String(strArr[j])).info(n: String(strArr[j])).0
                                }
                                /*
                                 Se il numero è valido e il carattere esattamente prima è maiuscolo, moltiplica la massa molare dell'elemento per l'indice e poi aggiungilo a somma. Dopo resetta intStr per resettare l'indice, altrimenti si accumula.
                                 
                                 Se il carattere prima non è "maiuscolo" perché è un numero, salta la condizione e va avanti
                                 */
                                else if (Int(String(strArr[j])) != nil && strArr[j - 1 >= 0 ? j - 1 : j].isUppercase) {
                                    semiSomma = El.init(n: String(strArr[j - 1 >= 0 ? j - 1 : j])).info(n: String(strArr[j - 1 >= 0 ? j - 1 : j])).0 * (Double(intStr) != nil ? Double(intStr)! : 1)
                                    somma += semiSomma
                                    intStr = ""
                                }
                                /*
                                 Se il numero è valido e il carattere esattamente prima è minuscolo, moltiplica la massa molare dell'elemento (ottenuto sommando il carattere due volte prima del numero a quello precedente al numero) e moltiplicalo per l'indice. Dopo resetta intStr
                                 
                                 Se il carattere prima non è "minuscolo" perché è un numero, salta la condizione e va avanti
                                */
                                else if (Int(String(strArr[j])) != nil && strArr[j - 1].isLowercase) {
                                    let characters: [Character] = [strArr[j - 2 >= 0 ? j - 2 : j - 1 >= 0 ? j : j - 1], strArr[j - 1 >= 0 ? j - 1 : j]]
                                    let semiString = String(characters)
                                    semiSomma = El.init(n: semiString).info(n: semiString).0 * (Double(intStr) ?? 1)
                                    somma += semiSomma
                                    intStr = ""
                                }
                                // Se la lettera è minuscola e dopo c'è un numero, l'operazione è gia stata fatta. Diminuisci l'indice e continua il loop
                                else if (strArr[j].isLowercase && Int(String(strArr[j + 1 < len ? j + 1: j])) != nil) {
                                    j -= 2
                                    continue
                                }
                                /*
                                 Se la lettera è minuscola, assegnala a una stringa per aggiungerla a un'altra stringa con la lettera maiuscola che viene prima
                                 */
                                else if (strArr[j].isLowercase) {
                                    vecchiaStr = String(strArr[j])
                                }
                                /*
                                 Se c'è una parentesi, c'è stato un numero prima, e non riguardava nessun elemento. Assegnalo a una variabile per tenerlo in memoria fino a che non si chiude la parentesi
                                 */
                                if (strArr[j] == ")") {
                                    intNVolte = intStr
                                    intStr = ""
                                }
                                /*
                                 Se si chiude la parentesi, moltiplica tutto quello che hai trovato dentro. Siccome in chimica le parentesi stanno sempre alla fine e non hanno nulla dopo, puoi moltiplicare tranquillamente tutta la somma, visto che il loop parte dalla fine
                                 */
                                if (strArr[j] == "(") {
                                    somma = somma * (Double(intNVolte) ?? 1)
                                }
                                
                                j -= 1
                                
                            }
                        }
                        .submitLabel(.done)
                    Button("Reset", action: {
                        somma = 0
                        formula = ""
                        elemento = ""
                        j = 0
                    })
                    .padding()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            }
        }
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView()
    }
}

extension String {
    
    var isLowercase: Bool {
        return self == self.lowercased()
    }
    
    var isUppercase: Bool {
        return self == self.uppercased()
    }
}


