//
//  ConvertMassView.swift
//  MassaMolare
//
//  Created by Luca Vigato on 21/06/22.
//

import SwiftUI

struct ConvertMassView: View {
    
    @State var startMassUnit: MassUnit = .pound
    @State var endMassUnit: MassUnit = .kilogram
    @State var startValueString = ""
    
    @State var conversionHistory: [MassConversion] = []
    
    var body: some View {
        VStack {
            TextField("Input", text: $startValueString)
                .keyboardType(.decimalPad)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.vertical)
            HStack {
                Picker("\(startMassUnit.rawValue)", selection: $startMassUnit) {
                    ForEach(MassUnit.allCases, id: \.self) { unit in
                        Text(unit.rawValue)
                            .font(.largeTitle)
                    }
                }
                Image(systemName: "arrow.right")
                Picker("\(endMassUnit.rawValue)", selection: $endMassUnit) {
                    ForEach(MassUnit.allCases, id: \.self) { MassUnit in
                        Text(MassUnit.rawValue)
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
                        
                        Text("\(currentConversion.startValue, format: .number) \(currentConversion.startMassUnit.rawValue) -> \(currentConversion.endValue, format: .number) \(currentConversion.endMassUnit.rawValue)")
                    }
                }
            }
        }
    }
    
    func convertUnit(valueToConvert: Double, fromUnit: MassUnit, toUnit: MassUnit) -> Double {
        return valueToConvert * fromUnit.conversionFactorToG / toUnit.conversionFactorToG
    }
    
    func saveConversion() {
        let formatter = NumberFormatter()
        var conversion = MassConversion(startMassUnit: .pound, endMassUnit: .kilogram)
        
        conversion.startMassUnit = startMassUnit
        conversion.endMassUnit = endMassUnit
        conversion.startValue = formatter.number(from: startValueString)?.doubleValue ?? 0
        conversion.endValue = convertUnit(valueToConvert: conversion.startValue, fromUnit: startMassUnit, toUnit: endMassUnit)
        conversionHistory.append(conversion)
    }
}

enum MassUnit: String, CaseIterable {
    case gram = "g"
    case ounce = "oz"
    case pound = "lb"
    case kilogram = "kg"
}

extension MassUnit {
    var conversionFactorToG: Double {
        switch self {
        case .gram:             return 1
        case .ounce:            return 28.3495
        case .pound:            return 453.592
        case .kilogram:         return 1000
        }
    }
}

struct MassConversion: Identifiable {
    var id: UUID = UUID()
    
    var startValue: Double = 0.0
    var startMassUnit: MassUnit
    var endValue: Double = 0.0
    var endMassUnit: MassUnit
}

struct ConvertMassView_Previews: PreviewProvider {
    static var previews: some View {
        ConvertMassView()
    }
}
