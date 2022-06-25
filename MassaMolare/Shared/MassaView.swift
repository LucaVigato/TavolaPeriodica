//
//  MassaView.swift
//  MassaMolare
//
//  Created by Luca Vigato on 23/04/22.
//

import SwiftUI

struct MassaView: View {
    var el1: [El] = [El.init(n: "H"), El.init(n: "Li"), El.init(n: "Na"), El.init(n: "K"), El.init(n: "Rb"), El.init(n: "Cs"), El.init(n: "Fr")]
    var el2: [El] = [El.init(n: ""), El.init(n: "Be"), El.init(n: "Mg"), El.init(n: "Ca"), El.init(n: "Sr"), El.init(n: "Ba"), El.init(n: "Ra")]
    var el3: [El] = [El.init(n: ""), El.init(n: ""), El.init(n: ""), El.init(n: "Sc"), El.init(n: "Y"), El.init(n: "La"), El.init(n: "Ac")]
    var el4: [El] = [El.init(n: ""), El.init(n: ""), El.init(n: ""), El.init(n: "Ti"), El.init(n: "Zr"), El.init(n: "Hf"), El.init(n: "Rf")]
    var el5: [El] = [El.init(n: ""), El.init(n: ""), El.init(n: ""), El.init(n: "V"), El.init(n: "Nb"), El.init(n: "Ta"), El.init(n: "Db")]
    var el6: [El] = [El.init(n: ""), El.init(n: ""), El.init(n: ""), El.init(n: "Cr"), El.init(n: "Mo"), El.init(n: "W"), El.init(n: "Sg")]
    var el7: [El] = [El.init(n: ""), El.init(n: ""), El.init(n: ""), El.init(n: "Mn"), El.init(n: "Tc"), El.init(n: "Re"), El.init(n: "Bh")]
    var el8: [El] = [El.init(n: ""), El.init(n: ""), El.init(n: ""), El.init(n: "Fe"), El.init(n: "Ru"), El.init(n: "Os"), El.init(n: "Hs")]
    var el9: [El] = [El.init(n: ""), El.init(n: ""), El.init(n: ""), El.init(n: "Co"), El.init(n: "Rh"), El.init(n: "Ir"), El.init(n: "Mt")]
    var el10: [El] = [El.init(n: ""), El.init(n: ""), El.init(n: ""), El.init(n: "Ni"), El.init(n: "Pd"), El.init(n: "Pt"), El.init(n: "Ds")]
    var el11: [El] = [El.init(n: ""), El.init(n: ""), El.init(n: ""), El.init(n: "Cu"), El.init(n: "Ag"), El.init(n: "Au"), El.init(n: "Rg")]
    var el12: [El] = [El.init(n: ""), El.init(n: ""), El.init(n: ""), El.init(n: "Zn"), El.init(n: "Cd"), El.init(n: "Hg"), El.init(n: "Cn")]
    var el13: [El] = [El.init(n: ""), El.init(n: "B"), El.init(n: "Al"), El.init(n: "Ga"), El.init(n: "In"), El.init(n: "Tl"), El.init(n: "Nh")]
    var el14: [El] = [El.init(n: ""), El.init(n: "C"), El.init(n: "Si"), El.init(n: "Ge"), El.init(n: "Sn"), El.init(n: "Pb"), El.init(n: "Fl")]
    var el15: [El] = [El.init(n: ""), El.init(n: "N"), El.init(n: "P"), El.init(n: "As"), El.init(n: "Sb"), El.init(n: "Bi"), El.init(n: "Mc")]
    var el16: [El] = [El.init(n: ""), El.init(n: "O"), El.init(n: "S"), El.init(n: "Se"), El.init(n: "Te"), El.init(n: "Po"), El.init(n: "Lv")]
    var el17: [El] = [El.init(n: ""), El.init(n: "F"), El.init(n: "Cl"), El.init(n: "Br"), El.init(n: "I"), El.init(n: "At"), El.init(n: "Ts")]
    var el18: [El] = [El.init(n: "He"), El.init(n: "Ne"), El.init(n: "Ar"), El.init(n: "Kr"), El.init(n: "Xe"), El.init(n: "Rn"), El.init(n: "Og")]
    var lantanidi: [El] = [El.init(n: "Ce"), El.init(n: "Pr"), El.init(n: "Nd"), El.init(n: "Pm"), El.init(n: "Sm"), El.init(n: "Eu"), El.init(n: "Gd"), El.init(n: "Tb"), El.init(n: "Dy"), El.init(n: "Ho"), El.init(n: "Er"), El.init(n: "Tm"), El.init(n: "Yb"), El.init(n: "Lu")]
    var attinidi: [El] = [El.init(n: "Th"), El.init(n: "Pa"), El.init(n: "U"), El.init(n: "Np"), El.init(n: "Pu"), El.init(n: "Am"), El.init(n: "Cm"), El.init(n: "Bk"), El.init(n: "Cf"), El.init(n: "Es"), El.init(n: "Fm"), El.init(n: "Md"), El.init(n: "No"), El.init(n: "Lr")]
    
    @State var somma: Double = 0
    @State var i: Int = 0
    @State var formula: String = ""
    
    var dimensione: CGFloat = UIScreen.main.bounds.height / 16
    @State var tema: String = "Default"
    
    var body: some View {
        VStack {
            VStack {
                VStack {
                    Button("Reset", action: {
                        i = 0
                        somma = 0
                        formula = ""
                    })
                    Text("massa-molare \(somma, format: .number)")
                    Text("\(i) selezionati \(formula)")
                }
                ScrollView(.horizontal) {
                    HStack {
                        Group {
                            VStack {
                                ForEach (el1, id: \.n) { index in
                                    ZStack {
                                        Elemento()
                                            .stroke(.black, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                                            .frame(width: dimensione, height: dimensione)
                                            .zIndex(1)
                                            .opacity(index.n != "" ? 1 : 0)
                                        Text("\(index.n)")
                                            .font(.system(size: dimensione + (calcDim(dim: dimensione) * 6)))
                                            .fontWeight(.bold)
                                            .frame(width: dimensione, height: dimensione)
                                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                                            .offset(x: calcDim(dim: dimensione), y: calcDim(dim: dimensione))
                                            .zIndex(1)
                                        Elemento()
                                            .fill(getColor(tema: tema, elem: index.n))
                                            .frame(width: dimensione, height: dimensione)
                                            .opacity(index.n != "" ? 1 : 0)
                                    }
                                    .onTapGesture {
                                        somma += index.info(n: index.n).0
                                        formula += index.n
                                        i += (index.n != "" ? 1 : 0)
                                    }
                                }
                            }
                            VStack {
                                ForEach (el2, id: \.n) { index in
                                    ZStack {
                                        Elemento()
                                            .stroke(.black, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                                            .frame(width: dimensione, height: dimensione)
                                            .zIndex(1)
                                            .opacity(index.n != "" ? 1 : 0)
                                        Text("\(index.n)")
                                            .font(.system(size: dimensione + (calcDim(dim: dimensione) * 6)))
                                            .fontWeight(.bold)
                                            .frame(width: dimensione, height: dimensione)
                                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                                            .offset(x: calcDim(dim: dimensione), y: calcDim(dim: dimensione))
                                            .zIndex(1)
                                        Elemento()
                                            .fill(getColor(tema: tema, elem: index.n))
                                            .frame(width: dimensione, height: dimensione)
                                            .opacity(index.n != "" ? 1 : 0)
                                    }
                                    .onTapGesture {
                                        somma += index.info(n: index.n).0
                                        formula += index.n
                                        i += (index.n != "" ? 1 : 0)
                                    }
                                }
                            }
                        }
                        Group {
                            VStack {
                                ForEach (el3, id: \.n) { index in
                                    ZStack {
                                        Elemento()
                                            .stroke(.black, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                                            .frame(width: dimensione, height: dimensione)
                                            .zIndex(1)
                                            .opacity(index.n != "" ? 1 : 0)
                                        Text("\(index.n)")
                                            .font(.system(size: dimensione + (calcDim(dim: dimensione) * 6)))
                                            .fontWeight(.bold)
                                            .frame(width: dimensione, height: dimensione)
                                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                                            .offset(x: calcDim(dim: dimensione), y: calcDim(dim: dimensione))
                                            .zIndex(1)
                                        Elemento()
                                            .fill(getColor(tema: tema, elem: index.n))
                                            .frame(width: dimensione, height: dimensione)
                                            .opacity(index.n != "" ? 1 : 0)
                                    }
                                    .onTapGesture {
                                        somma += index.info(n: index.n).0
                                        formula += index.n
                                        i += (index.n != "" ? 1 : 0)
                                    }
                                }
                            }
                            VStack {
                                ForEach (el4, id: \.n) { index in
                                    ZStack {
                                        Elemento()
                                            .stroke(.black, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                                            .frame(width: dimensione, height: dimensione)
                                            .zIndex(1)
                                            .opacity(index.n != "" ? 1 : 0)
                                        Text("\(index.n)")
                                            .font(.system(size: dimensione + (calcDim(dim: dimensione) * 6)))
                                            .fontWeight(.bold)
                                            .frame(width: dimensione, height: dimensione)
                                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                                            .offset(x: calcDim(dim: dimensione), y: calcDim(dim: dimensione))
                                            .zIndex(1)
                                        Elemento()
                                            .fill(getColor(tema: tema, elem: index.n))
                                            .frame(width: dimensione, height: dimensione)
                                            .opacity(index.n != "" ? 1 : 0)
                                    }
                                    .onTapGesture {
                                        somma += index.info(n: index.n).0
                                        formula += index.n
                                        i += (index.n != "" ? 1 : 0)
                                    }
                                }
                            }
                            VStack {
                                ForEach (el5, id: \.n) { index in
                                    ZStack {
                                        Elemento()
                                            .stroke(.black, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                                            .frame(width: dimensione, height: dimensione)
                                            .zIndex(1)
                                            .opacity(index.n != "" ? 1 : 0)
                                        Text("\(index.n)")
                                            .font(.system(size: dimensione + (calcDim(dim: dimensione) * 6)))
                                            .fontWeight(.bold)
                                            .frame(width: dimensione, height: dimensione)
                                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                                            .offset(x: calcDim(dim: dimensione), y: calcDim(dim: dimensione))
                                            .zIndex(1)
                                        Elemento()
                                            .fill(getColor(tema: tema, elem: index.n))
                                            .frame(width: dimensione, height: dimensione)
                                            .opacity(index.n != "" ? 1 : 0)
                                    }
                                    .onTapGesture {
                                        somma += index.info(n: index.n).0
                                        formula += index.n
                                        i += (index.n != "" ? 1 : 0)
                                    }
                                }
                            }
                            VStack {
                                ForEach (el6, id: \.n) { index in
                                    ZStack {
                                        Elemento()
                                            .stroke(.black, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                                            .frame(width: dimensione, height: dimensione)
                                            .zIndex(1)
                                            .opacity(index.n != "" ? 1 : 0)
                                        Text("\(index.n)")
                                            .font(.system(size: dimensione + (calcDim(dim: dimensione) * 6)))
                                            .fontWeight(.bold)
                                            .frame(width: dimensione, height: dimensione)
                                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                                            .offset(x: calcDim(dim: dimensione), y: calcDim(dim: dimensione))
                                            .zIndex(1)
                                        Elemento()
                                            .fill(getColor(tema: tema, elem: index.n))
                                            .frame(width: dimensione, height: dimensione)
                                            .opacity(index.n != "" ? 1 : 0)
                                    }
                                    .onTapGesture {
                                        somma += index.info(n: index.n).0
                                        formula += index.n
                                        i += (index.n != "" ? 1 : 0)
                                    }
                                }
                            }
                            VStack {
                                ForEach (el7, id: \.n) { index in
                                    ZStack {
                                        Elemento()
                                            .stroke(.black, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                                            .frame(width: dimensione, height: dimensione)
                                            .zIndex(1)
                                            .opacity(index.n != "" ? 1 : 0)
                                        Text("\(index.n)")
                                            .font(.system(size: dimensione + (calcDim(dim: dimensione) * 6)))
                                            .fontWeight(.bold)
                                            .frame(width: dimensione, height: dimensione)
                                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                                            .offset(x: calcDim(dim: dimensione), y: calcDim(dim: dimensione))
                                            .zIndex(1)
                                        Elemento()
                                            .fill(getColor(tema: tema, elem: index.n))
                                            .frame(width: dimensione, height: dimensione)
                                            .opacity(index.n != "" ? 1 : 0)
                                    }
                                    .onTapGesture {
                                        somma += index.info(n: index.n).0
                                        formula += index.n
                                        i += (index.n != "" ? 1 : 0)
                                    }
                                }
                            }
                            VStack {
                                ForEach (el8, id: \.n) { index in
                                    ZStack {
                                        Elemento()
                                            .stroke(.black, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                                            .frame(width: dimensione, height: dimensione)
                                            .zIndex(1)
                                            .opacity(index.n != "" ? 1 : 0)
                                        Text("\(index.n)")
                                            .font(.system(size: dimensione + (calcDim(dim: dimensione) * 6)))
                                            .fontWeight(.bold)
                                            .frame(width: dimensione, height: dimensione)
                                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                                            .offset(x: calcDim(dim: dimensione), y: calcDim(dim: dimensione))
                                            .zIndex(1)
                                        Elemento()
                                            .fill(getColor(tema: tema, elem: index.n))
                                            .frame(width: dimensione, height: dimensione)
                                            .opacity(index.n != "" ? 1 : 0)
                                    }
                                    .onTapGesture {
                                        somma += index.info(n: index.n).0
                                        formula += index.n
                                        i += (index.n != "" ? 1 : 0)
                                    }
                                }
                            }
                            VStack {
                                ForEach (el9, id: \.n) { index in
                                    ZStack {
                                        Elemento()
                                            .stroke(.black, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                                            .frame(width: dimensione, height: dimensione)
                                            .zIndex(1)
                                            .opacity(index.n != "" ? 1 : 0)
                                        Text("\(index.n)")
                                            .font(.system(size: dimensione + (calcDim(dim: dimensione) * 6)))
                                            .fontWeight(.bold)
                                            .frame(width: dimensione, height: dimensione)
                                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                                            .offset(x: calcDim(dim: dimensione), y: calcDim(dim: dimensione))
                                            .zIndex(1)
                                        Elemento()
                                            .fill(getColor(tema: tema, elem: index.n))
                                            .frame(width: dimensione, height: dimensione)
                                            .opacity(index.n != "" ? 1 : 0)
                                    }
                                    .onTapGesture {
                                        somma += index.info(n: index.n).0
                                        formula += index.n
                                        i += (index.n != "" ? 1 : 0)
                                    }
                                }
                            }
                            VStack {
                                ForEach (el10, id: \.n) { index in
                                    ZStack {
                                        Elemento()
                                            .stroke(.black, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                                            .frame(width: dimensione, height: dimensione)
                                            .zIndex(1)
                                            .opacity(index.n != "" ? 1 : 0)
                                        Text("\(index.n)")
                                            .font(.system(size: dimensione + (calcDim(dim: dimensione) * 6)))
                                            .fontWeight(.bold)
                                            .frame(width: dimensione, height: dimensione)
                                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                                            .offset(x: calcDim(dim: dimensione), y: calcDim(dim: dimensione))
                                            .zIndex(1)
                                        Elemento()
                                            .fill(getColor(tema: tema, elem: index.n))
                                            .frame(width: dimensione, height: dimensione)
                                            .opacity(index.n != "" ? 1 : 0)
                                    }
                                    .onTapGesture {
                                        somma += index.info(n: index.n).0
                                        formula += index.n
                                        i += (index.n != "" ? 1 : 0)
                                    }
                                }
                            }
                            VStack {
                                ForEach (el11, id: \.n) { index in
                                    ZStack {
                                        Elemento()
                                            .stroke(.black, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                                            .frame(width: dimensione, height: dimensione)
                                            .zIndex(1)
                                            .opacity(index.n != "" ? 1 : 0)
                                        Text("\(index.n)")
                                            .font(.system(size: dimensione + (calcDim(dim: dimensione) * 6)))
                                            .fontWeight(.bold)
                                            .frame(width: dimensione, height: dimensione)
                                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                                            .offset(x: calcDim(dim: dimensione), y: calcDim(dim: dimensione))
                                            .zIndex(1)
                                        Elemento()
                                            .fill(getColor(tema: tema, elem: index.n))
                                            .frame(width: dimensione, height: dimensione)
                                            .opacity(index.n != "" ? 1 : 0)
                                    }
                                    .onTapGesture {
                                        somma += index.info(n: index.n).0
                                        formula += index.n
                                        i += (index.n != "" ? 1 : 0)
                                    }
                                }
                            }
                            VStack {
                                ForEach (el12, id: \.n) { index in
                                    ZStack {
                                        Elemento()
                                            .stroke(.black, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                                            .frame(width: dimensione, height: dimensione)
                                            .zIndex(1)
                                            .opacity(index.n != "" ? 1 : 0)
                                        Text("\(index.n)")
                                            .font(.system(size: dimensione + (calcDim(dim: dimensione) * 6)))
                                            .fontWeight(.bold)
                                            .frame(width: dimensione, height: dimensione)
                                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                                            .offset(x: calcDim(dim: dimensione), y: calcDim(dim: dimensione))
                                            .zIndex(1)
                                        Elemento()
                                            .fill(getColor(tema: tema, elem: index.n))
                                            .frame(width: dimensione, height: dimensione)
                                            .opacity(index.n != "" ? 1 : 0)
                                    }
                                    .onTapGesture {
                                        somma += index.info(n: index.n).0
                                        formula += index.n
                                        i += (index.n != "" ? 1 : 0)
                                    }
                                }
                            }
                        }
                        Group {
                            VStack {
                                ForEach (el13, id: \.n) { index in
                                    ZStack {
                                        Elemento()
                                            .stroke(.black, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                                            .frame(width: dimensione, height: dimensione)
                                            .zIndex(1)
                                            .opacity(index.n != "" ? 1 : 0)
                                        Text("\(index.n)")
                                            .font(.system(size: dimensione + (calcDim(dim: dimensione) * 6)))
                                            .fontWeight(.bold)
                                            .frame(width: dimensione, height: dimensione)
                                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                                            .offset(x: calcDim(dim: dimensione), y: calcDim(dim: dimensione))
                                            .zIndex(1)
                                        Elemento()
                                            .fill(getColor(tema: tema, elem: index.n))
                                            .frame(width: dimensione, height: dimensione)
                                            .opacity(index.n != "" ? 1 : 0)
                                    }
                                    .onTapGesture {
                                        somma += index.info(n: index.n).0
                                        formula += index.n
                                        i += (index.n != "" ? 1 : 0)
                                    }
                                }
                            }
                            VStack {
                                ForEach (el14, id: \.n) { index in
                                    ZStack {
                                        Elemento()
                                            .stroke(.black, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                                            .frame(width: dimensione, height: dimensione)
                                            .zIndex(1)
                                            .opacity(index.n != "" ? 1 : 0)
                                        Text("\(index.n)")
                                            .font(.system(size: dimensione + (calcDim(dim: dimensione) * 6)))
                                            .fontWeight(.bold)
                                            .frame(width: dimensione, height: dimensione)
                                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                                            .offset(x: calcDim(dim: dimensione), y: calcDim(dim: dimensione))
                                            .zIndex(1)
                                        Elemento()
                                            .fill(getColor(tema: tema, elem: index.n))
                                            .frame(width: dimensione, height: dimensione)
                                            .opacity(index.n != "" ? 1 : 0)
                                    }
                                    .onTapGesture {
                                        somma += index.info(n: index.n).0
                                        formula += index.n
                                        i += (index.n != "" ? 1 : 0)
                                    }
                                }
                            }
                            VStack {
                                ForEach (el15, id: \.n) { index in
                                    ZStack {
                                        Elemento()
                                            .stroke(.black, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                                            .frame(width: dimensione, height: dimensione)
                                            .zIndex(1)
                                            .opacity(index.n != "" ? 1 : 0)
                                        Text("\(index.n)")
                                            .font(.system(size: dimensione + (calcDim(dim: dimensione) * 6)))
                                            .fontWeight(.bold)
                                            .frame(width: dimensione, height: dimensione)
                                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                                            .offset(x: calcDim(dim: dimensione), y: calcDim(dim: dimensione))
                                            .zIndex(1)
                                        Elemento()
                                            .fill(getColor(tema: tema, elem: index.n))
                                            .frame(width: dimensione, height: dimensione)
                                            .opacity(index.n != "" ? 1 : 0)
                                    }
                                    .onTapGesture {
                                        somma += index.info(n: index.n).0
                                        formula += index.n
                                        i += (index.n != "" ? 1 : 0)
                                    }
                                }
                            }
                            VStack {
                                ForEach (el16, id: \.n) { index in
                                    ZStack {
                                        Elemento()
                                            .stroke(.black, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                                            .frame(width: dimensione, height: dimensione)
                                            .zIndex(1)
                                            .opacity(index.n != "" ? 1 : 0)
                                        Text("\(index.n)")
                                            .font(.system(size: dimensione + (calcDim(dim: dimensione) * 6)))
                                            .fontWeight(.bold)
                                            .frame(width: dimensione, height: dimensione)
                                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                                            .offset(x: calcDim(dim: dimensione), y: calcDim(dim: dimensione))
                                            .zIndex(1)
                                        Elemento()
                                            .fill(getColor(tema: tema, elem: index.n))
                                            .frame(width: dimensione, height: dimensione)
                                            .opacity(index.n != "" ? 1 : 0)
                                    }
                                    .onTapGesture {
                                        somma += index.info(n: index.n).0
                                        formula += index.n
                                        i += (index.n != "" ? 1 : 0)
                                    }
                                }
                            }
                            VStack {
                                ForEach (el17, id: \.n) { index in
                                    ZStack {
                                        Elemento()
                                            .stroke(.black, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                                            .frame(width: dimensione, height: dimensione)
                                            .zIndex(1)
                                            .opacity(index.n != "" ? 1 : 0)
                                        Text("\(index.n)")
                                            .font(.system(size: dimensione + (calcDim(dim: dimensione) * 6)))
                                            .fontWeight(.bold)
                                            .frame(width: dimensione, height: dimensione)
                                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                                            .offset(x: calcDim(dim: dimensione), y: calcDim(dim: dimensione))
                                            .zIndex(1)
                                        Elemento()
                                            .fill(getColor(tema: tema, elem: index.n))
                                            .frame(width: dimensione, height: dimensione)
                                            .opacity(index.n != "" ? 1 : 0)
                                    }
                                    .onTapGesture {
                                        somma += index.info(n: index.n).0
                                        formula += index.n
                                        i += (index.n != "" ? 1 : 0)
                                    }
                                }
                            }
                        }
                        Group {
                            VStack {
                                ForEach (el18, id: \.n) { index in
                                    ZStack {
                                        Elemento()
                                            .stroke(.black, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                                            .frame(width: dimensione, height: dimensione)
                                            .zIndex(1)
                                            .opacity(index.n != "" ? 1 : 0)
                                        Text("\(index.n)")
                                            .font(.system(size: dimensione + (calcDim(dim: dimensione) * 6)))
                                            .fontWeight(.bold)
                                            .frame(width: dimensione, height: dimensione)
                                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                                            .offset(x: calcDim(dim: dimensione), y: calcDim(dim: dimensione))
                                            .zIndex(1)
                                        Elemento()
                                            .fill(getColor(tema: tema, elem: index.n))
                                            .frame(width: dimensione, height: dimensione)
                                            .opacity(index.n != "" ? 1 : 0)
                                    }
                                    .onTapGesture {
                                        somma += index.info(n: index.n).0
                                        formula += index.n
                                        i += (index.n != "" ? 1 : 0)
                                    }
                                }
                            }
                        }
                    }
                    .padding(.top)
                    .padding(.leading)
                    .padding(.trailing)
                    .frame(maxHeight: .infinity, alignment: .center)
                
                
                    VStack {
                        HStack {
                            ForEach (lantanidi, id: \.n) { index in
                                ZStack {
                                    Elemento()
                                        .stroke(.black, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                                        .frame(width: dimensione, height: dimensione)
                                        .zIndex(1)
                                        .opacity(index.n != "" ? 1 : 0)
                                    Text("\(index.n)")
                                        .font(.system(size: dimensione + (calcDim(dim: dimensione) * 6)))
                                        .fontWeight(.bold)
                                        .frame(width: dimensione, height: dimensione)
                                        .offset(x: calcDim(dim: dimensione), y: calcDim(dim: dimensione))
                                        .zIndex(1)
                                    Elemento()
                                        .fill(getColor(tema: tema, elem: index.n))
                                        .frame(width: dimensione, height: dimensione)
                                        .opacity(index.n != "" ? 1 : 0)
                                }
                                .onTapGesture {
                                    somma += index.info(n: index.n).0
                                    formula += index.n
                                    i += (index.n != "" ? 1 : 0)
                                }
                            }
                        }
                        HStack {
                            ForEach (attinidi, id: \.n) { index in
                                ZStack {
                                    Elemento()
                                        .stroke(.black, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                                        .frame(width: dimensione, height: dimensione)
                                        .zIndex(1)
                                        .opacity(index.n != "" ? 1 : 0)
                                    Text("\(index.n)")
                                        .font(.system(size: dimensione + (calcDim(dim: dimensione) * 6)))
                                        .fontWeight(.bold)
                                        .frame(width: dimensione, height: dimensione)
                                        .offset(x: calcDim(dim: dimensione), y: calcDim(dim: dimensione))
                                        .zIndex(1)
                                    Elemento()
                                        .fill(getColor(tema: tema, elem: index.n))
                                        .frame(width: dimensione, height: dimensione)
                                        .opacity(index.n != "" ? 1 : 0)
                                }
                                .onTapGesture {
                                    somma += index.info(n: index.n).0
                                    formula += index.n
                                    i += (index.n != "" ? 1 : 0)
                                }
                            }
                        }
                    }
                    .frame(maxHeight: .infinity, alignment: .top)
                }
                .frame(maxHeight: .infinity, alignment: .center)
            }
        }
    }
}

struct MassaView_Previews: PreviewProvider {
    static var previews: some View {
        MassaView()
    }
}
