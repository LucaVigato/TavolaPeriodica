//
//  ConvertEnergyView.swift
//  MassaMolare
//
//  Created by Luca Vigato on 21/06/22.
//

import SwiftUI

struct ConvertEnergyView: View {
    
    @State var startEnergyUnit: EnergyUnit = .cal
    @State var endEnergyUnit: EnergyUnit = .joule
    @State var startValueString = ""
    
    @State var conversionHistory: [EnergyConversion] = []
    
    var body: some View {
        VStack {
            TextField("Input", text: $startValueString)
                .keyboardType(.decimalPad)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.vertical)
            HStack {
                Picker("\(startEnergyUnit.rawValue)", selection: $startEnergyUnit) {
                    ForEach(EnergyUnit.allCases, id: \.self) { unit in
                        Text(unit.rawValue)
                            .font(.largeTitle)
                    }
                }
                Image(systemName: "arrow.right")
                Picker("\(endEnergyUnit.rawValue)", selection: $endEnergyUnit) {
                    ForEach(EnergyUnit.allCases, id: \.self) { EnergyUnit in
                        Text(EnergyUnit.rawValue)
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
                        
                        Text("\(currentConversion.startValue, format: .number) \(currentConversion.startEnergyUnit.rawValue) -> \(currentConversion.endValue, format: .number) \(currentConversion.endEnergyUnit.rawValue)")
                    }
                }
            }
        }
    }
    
    func convertUnit(valueToConvert: Double, fromUnit: EnergyUnit, toUnit: EnergyUnit) -> Double {
        return valueToConvert * fromUnit.conversionFactorToCal / toUnit.conversionFactorToCal
    }
    
    func saveConversion() {
        let formatter = NumberFormatter()
        var conversion = EnergyConversion(startEnergyUnit: .cal, endEnergyUnit: .joule)
        
        conversion.startEnergyUnit = startEnergyUnit
        conversion.endEnergyUnit = endEnergyUnit
        conversion.startValue = formatter.number(from: startValueString)?.doubleValue ?? 0
        conversion.endValue = convertUnit(valueToConvert: conversion.startValue, fromUnit: startEnergyUnit, toUnit: endEnergyUnit)
        conversionHistory.append(conversion)
    }
}

enum EnergyUnit: String, CaseIterable {
    case joule = "j"
    case kcal = "kcal"
    case cal = "cal"
    case watth = "Wh"
}

extension EnergyUnit {
    var conversionFactorToCal: Double {
        switch self {
        case .cal:              return 1
        case .joule:            return 0.239006
        case .kcal:             return 1000
        case .watth:            return 860.421
        }
    }
}

struct EnergyConversion: Identifiable {
    var id: UUID = UUID()
    
    var startValue: Double = 0.0
    var startEnergyUnit: EnergyUnit
    var endValue: Double = 0.0
    var endEnergyUnit: EnergyUnit
}
struct ConvertEnergyView_Previews: PreviewProvider {
    static var previews: some View {
        ConvertEnergyView()
    }
}
