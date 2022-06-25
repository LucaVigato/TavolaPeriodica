//
//  TableView.swift
//  MassaMolare
//
//  Created by Luca Vigato on 23/04/22.
//

import SwiftUI

struct TableView: View {
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
    
    var dimensione: CGFloat = UIScreen.main.bounds.height / 13.5
    @State var tema: String = "Default"
    
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    ScrollView(.horizontal) {
                        HStack {
                            Group {
                                VStack {
                                    ForEach (el1, id: \.n) { index in
                                        NavigationLink(destination: DetailView(elemento: index.n)) {
                                            ZStack {
                                                Elemento()
                                                    .stroke(.black, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                                                    .frame(width: dimensione, height: dimensione)
                                                    .zIndex(1)
                                                    .opacity(index.n != "" ? 1 : 0)
                                                Text("\(index.n)")
                                                    .foregroundColor(.black)
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
                                        }
                                        .disabled(index.n == "")
                                    }
                                }
                                VStack {
                                    ForEach (el2, id: \.n) { index in
                                        NavigationLink(destination: DetailView(elemento: index.n)) {
                                            ZStack {
                                                Elemento()
                                                    .stroke(.black, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                                                    .frame(width: dimensione, height: dimensione)
                                                    .zIndex(1)
                                                    .opacity(index.n != "" ? 1 : 0)
                                                Text("\(index.n)")
                                                    .foregroundColor(.black)
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
                                        }
                                        .disabled(index.n == "")
                                    }
                                }
                            }
                            Group {
                                VStack {
                                    ForEach (el3, id: \.n) { index in
                                        NavigationLink(destination: DetailView(elemento: index.n)) {
                                            ZStack {
                                                Elemento()
                                                    .stroke(.black, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                                                    .frame(width: dimensione, height: dimensione)
                                                    .zIndex(1)
                                                    .opacity(index.n != "" ? 1 : 0)
                                                Text("\(index.n)")
                                                    .foregroundColor(.black)
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
                                        }
                                        .disabled(index.n == "")
                                    }
                                }
                                VStack {
                                    ForEach (el4, id: \.n) { index in
                                        NavigationLink(destination: DetailView(elemento: index.n)) {
                                            ZStack {
                                                Elemento()
                                                    .stroke(.black, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                                                    .frame(width: dimensione, height: dimensione)
                                                    .zIndex(1)
                                                    .opacity(index.n != "" ? 1 : 0)
                                                Text("\(index.n)")
                                                    .foregroundColor(.black)
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
                                        }
                                        .disabled(index.n == "")
                                    }
                                }
                                VStack {
                                    ForEach (el5, id: \.n) { index in
                                        NavigationLink(destination: DetailView(elemento: index.n)) {
                                            ZStack {
                                                Elemento()
                                                    .stroke(.black, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                                                    .frame(width: dimensione, height: dimensione)
                                                    .zIndex(1)
                                                    .opacity(index.n != "" ? 1 : 0)
                                                Text("\(index.n)")
                                                    .foregroundColor(.black)
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
                                        }
                                        .disabled(index.n == "")
                                    }
                                }
                                VStack {
                                    ForEach (el6, id: \.n) { index in
                                        NavigationLink(destination: DetailView(elemento: index.n)) {
                                            ZStack {
                                                Elemento()
                                                    .stroke(.black, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                                                    .frame(width: dimensione, height: dimensione)
                                                    .zIndex(1)
                                                    .opacity(index.n != "" ? 1 : 0)
                                                Text("\(index.n)")
                                                    .foregroundColor(.black)
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
                                        }
                                        .disabled(index.n == "")
                                    }
                                }
                                VStack {
                                    ForEach (el7, id: \.n) { index in
                                        NavigationLink(destination: DetailView(elemento: index.n)) {
                                            ZStack {
                                                Elemento()
                                                    .stroke(.black, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                                                    .frame(width: dimensione, height: dimensione)
                                                    .zIndex(1)
                                                    .opacity(index.n != "" ? 1 : 0)
                                                Text("\(index.n)")
                                                    .foregroundColor(.black)
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
                                        }
                                        .disabled(index.n == "")
                                    }
                                }
                                VStack {
                                    ForEach (el8, id: \.n) { index in
                                        NavigationLink(destination: DetailView(elemento: index.n)) {
                                            ZStack {
                                                Elemento()
                                                    .stroke(.black, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                                                    .frame(width: dimensione, height: dimensione)
                                                    .zIndex(1)
                                                    .opacity(index.n != "" ? 1 : 0)
                                                Text("\(index.n)")
                                                    .foregroundColor(.black)
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
                                        }
                                        .disabled(index.n == "")
                                    }
                                }
                                VStack {
                                    ForEach (el9, id: \.n) { index in
                                        NavigationLink(destination: DetailView(elemento: index.n)) {
                                            ZStack {
                                                Elemento()
                                                    .stroke(.black, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                                                    .frame(width: dimensione, height: dimensione)
                                                    .zIndex(1)
                                                    .opacity(index.n != "" ? 1 : 0)
                                                Text("\(index.n)")
                                                    .foregroundColor(.black)
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
                                        }
                                        .disabled(index.n == "")
                                    }
                                }
                                VStack {
                                    ForEach (el10, id: \.n) { index in
                                        NavigationLink(destination: DetailView(elemento: index.n)) {
                                            ZStack {
                                                Elemento()
                                                    .stroke(.black, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                                                    .frame(width: dimensione, height: dimensione)
                                                    .zIndex(1)
                                                    .opacity(index.n != "" ? 1 : 0)
                                                Text("\(index.n)")
                                                    .foregroundColor(.black)
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
                                        }
                                        .disabled(index.n == "")
                                    }
                                }
                                VStack {
                                    ForEach (el11, id: \.n) { index in
                                        NavigationLink(destination: DetailView(elemento: index.n)) {
                                            ZStack {
                                                Elemento()
                                                    .stroke(.black, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                                                    .frame(width: dimensione, height: dimensione)
                                                    .zIndex(1)
                                                    .opacity(index.n != "" ? 1 : 0)
                                                Text("\(index.n)")
                                                    .foregroundColor(.black)
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
                                        }
                                        .disabled(index.n == "")
                                    }
                                }
                                VStack {
                                    ForEach (el12, id: \.n) { index in
                                        NavigationLink(destination: DetailView(elemento: index.n)) {
                                            ZStack {
                                                Elemento()
                                                    .stroke(.black, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                                                    .frame(width: dimensione, height: dimensione)
                                                    .zIndex(1)
                                                    .opacity(index.n != "" ? 1 : 0)
                                                Text("\(index.n)")
                                                    .foregroundColor(.black)
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
                                        }
                                        .disabled(index.n == "")
                                    }
                                }
                            }
                            Group {
                                VStack {
                                    ForEach (el13, id: \.n) { index in
                                        NavigationLink(destination: DetailView(elemento: index.n)) {
                                            ZStack {
                                                Elemento()
                                                    .stroke(.black, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                                                    .frame(width: dimensione, height: dimensione)
                                                    .zIndex(1)
                                                    .opacity(index.n != "" ? 1 : 0)
                                                Text("\(index.n)")
                                                    .foregroundColor(.black)
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
                                        }
                                        .disabled(index.n == "")
                                    }
                                }
                                VStack {
                                    ForEach (el14, id: \.n) { index in
                                        NavigationLink(destination: DetailView(elemento: index.n)) {
                                            ZStack {
                                                Elemento()
                                                    .stroke(.black, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                                                    .frame(width: dimensione, height: dimensione)
                                                    .zIndex(1)
                                                    .opacity(index.n != "" ? 1 : 0)
                                                Text("\(index.n)")
                                                    .foregroundColor(.black)
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
                                        }
                                        .disabled(index.n == "")
                                    }
                                }
                                VStack {
                                    ForEach (el15, id: \.n) { index in
                                        NavigationLink(destination: DetailView(elemento: index.n)) {
                                            ZStack {
                                                Elemento()
                                                    .stroke(.black, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                                                    .frame(width: dimensione, height: dimensione)
                                                    .zIndex(1)
                                                    .opacity(index.n != "" ? 1 : 0)
                                                Text("\(index.n)")
                                                    .foregroundColor(.black)
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
                                        }
                                        .disabled(index.n == "")
                                    }
                                }
                                VStack {
                                    ForEach (el16, id: \.n) { index in
                                        NavigationLink(destination: DetailView(elemento: index.n)) {
                                            ZStack {
                                                Elemento()
                                                    .stroke(.black, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                                                    .frame(width: dimensione, height: dimensione)
                                                    .zIndex(1)
                                                    .opacity(index.n != "" ? 1 : 0)
                                                Text("\(index.n)")
                                                    .foregroundColor(.black)
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
                                        }
                                        .disabled(index.n == "")
                                    }
                                }
                                VStack {
                                    ForEach (el17, id: \.n) { index in
                                        NavigationLink(destination: DetailView(elemento: index.n)) {
                                            ZStack {
                                                Elemento()
                                                    .stroke(.black, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                                                    .frame(width: dimensione, height: dimensione)
                                                    .zIndex(1)
                                                    .opacity(index.n != "" ? 1 : 0)
                                                Text("\(index.n)")
                                                    .foregroundColor(.black)
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
                                        }
                                        .disabled(index.n == "")
                                    }
                                }
                            }
                            Group {
                                VStack {
                                    ForEach (el18, id: \.n) { index in
                                        NavigationLink(destination: DetailView(elemento: index.n)) {
                                            ZStack {
                                                Elemento()
                                                    .stroke(.black, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                                                    .frame(width: dimensione, height: dimensione)
                                                    .zIndex(1)
                                                    .opacity(index.n != "" ? 1 : 0)
                                                Text("\(index.n)")
                                                    .foregroundColor(.black)
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
                                        }
                                        .disabled(index.n == "")
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
                                    NavigationLink(destination: DetailView(elemento: index.n)) {
                                        ZStack {
                                            Elemento()
                                                .stroke(.black, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                                                .frame(width: dimensione, height: dimensione)
                                                .zIndex(1)
                                                .opacity(index.n != "" ? 1 : 0)
                                            Text("\(index.n)")
                                                .foregroundColor(.black)
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
                                    }
                                    .disabled(index.n == "")
                                }
                            }
                            HStack {
                                ForEach (attinidi, id: \.n) { index in
                                    NavigationLink(destination: DetailView(elemento: index.n)) {
                                        ZStack {
                                            Elemento()
                                                .stroke(.black, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                                                .frame(width: dimensione, height: dimensione)
                                                .zIndex(1)
                                                .opacity(index.n != "" ? 1 : 0)
                                            Text("\(index.n)")
                                                .foregroundColor(.black)
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
                                    }
                                    .disabled(index.n == "")
                                }
                            }
                        }
                        .frame(maxHeight: .infinity, alignment: .top)
                    }
                    .frame(maxHeight: .infinity, alignment: .center)
                }
            }
            .navigationBarTitle("Tavola", displayMode: .inline)
            .toolbar {
                ToolbarItemGroup {
                    Menu("\(Image(systemName: "line.3.horizontal.decrease.circle"))") {
                        Button("Default") {
                            tema = "Default"
                        }
                        Button("Ebollizione") {
                            tema = "Ebollizione"
                        }
                        Button("Elettronegatività") {
                            tema = "Elettronegatività"
                        }
                        Button("Fusione") {
                            tema = "Fusione"
                        }
                        Button("SATP") {
                            tema = "SATP"
                        }
                        Button("Densità") {
                            tema = "Densità"
                        }
                        Button("Radioattivi") {
                            tema = "Radioattivi"
                        }
                        Menu("Filtri") {
                            Button("Metalli del blocco p") {
                                tema = "Metalli del blocco p"
                            }
                            Button("Metalli del blocco d") {
                                tema = "Metalli del blocco d"
                            }
                            Button("Metalli alcalini") {
                                tema = "Metalli alcalini"
                            }
                            Button("Metalli alcalino terrosi") {
                                tema = "Metalli alcalino terrosi"
                            }
                            Button("Non metalli") {
                                tema = "Non metalli"
                            }
                            Button("Semimetalli") {
                                tema = "Semimetalli"
                            }
                            Button("Alogeni") {
                                tema = "Alogeni"
                            }
                            Button("Gas nobili") {
                                tema = "Gas nobili"
                            }
                            Button("Lantanidi") {
                                tema = "Lantanidi"
                            }
                            Button("Attinidi") {
                                tema = "Attinidi"
                            }
                        }
                    }
                }
            }
        }
    }
}

func calcDim(dim: CGFloat) -> CGFloat {
    return (dim - (dim / 2) * 5 / 3) / -2
}

func getColor(tema: String, elem: String) -> Color {
    let color: Color
    let blocco: String = El.init(n: elem).info(n: elem).4
    switch (tema) {
    case "Ebollizione":
        let number = Double(El.init(n: elem).info(n: elem).9)
        color = Color.init(hue: 0/360, saturation: (number ?? 0)/5928, brightness: 1.0)
    case "Elettronegatività":
        let number = El.init(n: elem).info(n: elem).6
        color = Color.init(hue: 30/360, saturation: number / 3.98, brightness: 1.0)
    case "Fusione":
        let number = Double(El.init(n: elem).info(n: elem).8)
        color = Color.init(hue: 180/360, saturation: (number ?? 0) / 3695, brightness: 1.0)
    case "SATP":
        if (El.init(n: elem).info(n: elem).7 == "Gas") {
            color = .orange
        }
        else if (El.init(n: elem).info(n: elem).7 == "Liquido")
        {
            color = .blue
        }
        else
        {
            color = .gray
        }
    case "Densità":
        let number = El.init(n: elem).info(n: elem).13
        color = Color.init(hue: 270/360, saturation: number / 22600, brightness: 1)
    case "Metalli del blocco p":
        if (El.init(n: elem).info(n: elem).4 == "Metalli del blocco p") {
            color = .mint
        }
        else {
            color = .white
        }
    case "Metalli alcalini":
        if (El.init(n: elem).info(n: elem).4 == "Metalli alcalini") {
            color = .red
        }
        else {
            color = .white
        }
    case "Non metalli":
        if (El.init(n: elem).info(n: elem).4 == "Non metalli") {
            color = .yellow
        }
        else {
            color = .white
        }
    case "Gas nobili":
        if (El.init(n: elem).info(n: elem).4 == "Gas nobili") {
            color = .blue
        }
        else {
            color = .white
        }
    case "Metalli alcalino terrosi":
        if (El.init(n: elem).info(n: elem).4 == "Metalli alcalino terrosi") {
            color = .orange
        }
        else {
            color = .white
        }
    case "Semimetalli":
        if (El.init(n: elem).info(n: elem).4 == "Semimetalli") {
            color = .green
        }
        else {
            color = .white
        }
    case "Metalli del blocco d":
        if (El.init(n: elem).info(n: elem).4 == "Metalli del blocco d") {
            color = .gray
        }
        else {
            color = .white
        }
    case "Lantanidi":
        if (El.init(n: elem).info(n: elem).4 == "Lantanidi") {
            color = .purple
        }
        else {
            color = .white
        }
    case "Attinidi":
        if (El.init(n: elem).info(n: elem).4 == "Attinidi") {
            color = .cyan
        }
        else {
            color = .white
        }
    case "Alogeni":
        if (El.init(n: elem).info(n: elem).4 == "Alogeni") {
            color = .brown
        }
        else {
            color = .white
        }
    case "Radioattivi":
        if (El.init(n: elem).info(n: elem).12) {
            color = .init(red: 44/255, green: 250/255, blue: 31/255)
        }
        else
        {
            color = .white
        }
    case "Default":
        color = defaultColor(blocco: blocco)
    default:
        color = defaultColor(blocco: blocco)
    }
    
    return color
}

func defaultColor(blocco: String) -> Color {
    var color: Color
    
    switch blocco {
    case "Metalli alcalini":
        color = .red
    case "Non metalli":
        color = .yellow
    case "Gas nobili":
        color = .blue
    case "Metalli alcalino terrosi":
        color = .orange
    case "Semimetalli":
        color = .green
    case "Metalli del blocco p":
        color = .mint
    case "Metalli del blocco d":
        color = .gray
    case "Lantanidi":
        color = .purple
    case "Attinidi":
        color = .cyan
    case "Alogeni":
        color = .brown
    default:
        color = .white
    }
    
    return color
}

struct Elemento: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.maxX, y: rect.maxY)) // inizio in basso a destra
        path.addLine(to: CGPoint(x: rect.maxX - (rect.midX*5/3), y: rect.maxY)) // linea in basso
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY + (rect.midY*5/3))) // angolo in basso a sinistra
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY)) // linea a sinistra
        path.addLine(to: CGPoint(x: rect.minX + (rect.midX*5/3), y: rect.minY)) // linea in alto
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - (rect.midY*5/3))) // angolo in alto a destra
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY)) // linea di destra
        path.addLine(to: CGPoint(x: rect.midX*5/3, y: rect.midY*5/3)) // angolo in basso a destra
        path.addLine(to: CGPoint(x: rect.midX*5/3, y: rect.minY)) // linea tridimensionale in basso
        path.move(to: CGPoint(x: rect.midX*5/3, y: rect.midY*5/3)) // spostati sull'angolo
        path.addLine(to: CGPoint(x: rect.minX, y: rect.midY*5/3)) // linea tridimensionale a destra
        
        return path
    }
}

struct TableView_Previews: PreviewProvider {
    static var previews: some View {
        TableView()
            .previewDevice("iPhone X")
    }
}
