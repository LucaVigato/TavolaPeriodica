//
//  ConvertPressionView.swift
//  MassaMolare
//
//  Created by Luca Vigato on 21/06/22.
//

import SwiftUI

struct ConvertPressionView: View {
    
    @State var startPressionUnit: PressionUnit = .atm
    @State var endPressionUnit: PressionUnit = .bar
    @State var startValueString = ""
    
    @State var conversionHistory: [PressionConversion] = []
    
    var body: some View {
        VStack {
            TextField("Input", text: $startValueString)
                .keyboardType(.decimalPad)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.vertical)
            HStack {
                Picker("\(startPressionUnit.rawValue)", selection: $startPressionUnit) {
                    ForEach(PressionUnit.allCases, id: \.self) { unit in
                        Text(unit.rawValue)
                            .font(.largeTitle)
                    }
                }
                Image(systemName: "arrow.right")
                Picker("\(endPressionUnit.rawValue)", selection: $endPressionUnit) {
                    ForEach(PressionUnit.allCases, id: \.self) { PressionUnit in
                        Text(PressionUnit.rawValue)
                            .font(.largeTitle)
                    }
                }
            }
            .padding()
            ZStack {
                Button(action: {
                    saveConversion()
                }) {
                    Text("Convert")
                }
                .padding()
                .background(.green)
                .foregroundColor(.black)
                .cornerRadius(15)
                .frame(maxWidth: .infinity, alignment: .center)
            }
            .padding()
            List {
                ForEach(conversionHistory.reversed()) { currentConversion in
                    HStack {
                        Spacer()
                        
                        Text("\(currentConversion.startValue, format: .number) \(currentConversion.startPressionUnit.rawValue) -> \(currentConversion.endValue, format: .number) \(currentConversion.endPressionUnit.rawValue)")
                    }
                }
            }
        }
    }
    
    func convertUnit(valueToConvert: Double, fromUnit: PressionUnit, toUnit: PressionUnit) -> Double {
        return valueToConvert * fromUnit.conversionFactorToCal / toUnit.conversionFactorToCal
    }
    
    func saveConversion() {
        let formatter = NumberFormatter()
        var conversion = PressionConversion(startPressionUnit: .atm, endPressionUnit: .bar)
        
        conversion.startPressionUnit = startPressionUnit
        conversion.endPressionUnit = endPressionUnit
        conversion.startValue = formatter.number(from: startValueString)?.doubleValue ?? 0
        conversion.endValue = convertUnit(valueToConvert: conversion.startValue, fromUnit: startPressionUnit, toUnit: endPressionUnit)
        conversionHistory.append(conversion)
    }
}

enum PressionUnit: String, CaseIterable {
    case bar = "bar"
    case kilopascal = "kPa"
    case torr = "torr"
    case atm = "atm"
}

extension PressionUnit {
    var conversionFactorToCal: Double {
        switch self {
        case .atm:              return 1
        case .bar:              return 0.986923
        case .kilopascal:       return 0.00986923
        case .torr:             return 0.00131579
        }
    }
}

struct PressionConversion: Identifiable {
    var id: UUID = UUID()
    
    var startValue: Double = 0.0
    var startPressionUnit: PressionUnit
    var endValue: Double = 0.0
    var endPressionUnit: PressionUnit
}
struct ConvertPressionView_Previews: PreviewProvider {
    static var previews: some View {
        ConvertPressionView()
    }
}
