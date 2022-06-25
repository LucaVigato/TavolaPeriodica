//
//  ConvertMassaView.swift
//  MassaMolare
//
//  Created by Luca Vigato on 20/06/22.
//

import SwiftUI

struct ConvertLengthView: View {
    
    @State var startLengthUnit: LengthUnit = .kilometer
    @State var endLengthUnit: LengthUnit = .mile
    @State var startValueString = ""
    
    @State var conversionHistory: [LengthConversion] = []
    
    var body: some View {
        VStack {
            TextField("Input", text: $startValueString)
                .keyboardType(.decimalPad)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.vertical)
            HStack {
                Picker("\(startLengthUnit.rawValue)", selection: $startLengthUnit) {
                    ForEach(LengthUnit.allCases, id: \.self) { unit in
                        Text(unit.rawValue)
                            .font(.largeTitle)
                    }
                }
                Image(systemName: "arrow.right")
                Picker("\(endLengthUnit.rawValue)", selection: $endLengthUnit) {
                    ForEach(LengthUnit.allCases, id: \.self) { LengthUnit in
                        Text(LengthUnit.rawValue)
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
                        
                        Text("\(currentConversion.startValue, format: .number) \(currentConversion.startLengthUnit.rawValue) -> \(currentConversion.endValue, format: .number) \(currentConversion.endLengthUnit.rawValue)")
                    }
                }
            }
        }
    }
    
    func convertUnit(valueToConvert: Double, fromUnit: LengthUnit, toUnit: LengthUnit) -> Double {
        return valueToConvert * fromUnit.conversionFactorToMeter / toUnit.conversionFactorToMeter
    }
    
    func saveConversion() {
        let formatter = NumberFormatter()
        var conversion = LengthConversion(startLengthUnit: .mile, endLengthUnit: .mile)
        
        conversion.startLengthUnit = startLengthUnit
        conversion.endLengthUnit = endLengthUnit
        conversion.startValue = formatter.number(from: startValueString)?.doubleValue ?? 0
        conversion.endValue = convertUnit(valueToConvert: conversion.startValue, fromUnit: startLengthUnit, toUnit: endLengthUnit)
        conversionHistory.append(conversion)
    }
}

enum LengthUnit: String, CaseIterable {
    case inch = "in"
    case foot = "ft"
    case yard = "yd"
    case meter = "m"
    case kilometer = "km"
    case mile = "mi"
    case nauticMile = "nmi"
}

extension LengthUnit {
    var conversionFactorToMeter: Double {
        switch self {
        case .inch:             return 0.0254
        case .foot:             return 0.3048
        case .yard:             return 0.9144
        case .meter:            return 1
        case .kilometer:        return 1000
        case .mile:             return 1609.344
        case .nauticMile:       return 1852
        }
    }
}

struct LengthConversion: Identifiable {
    var id: UUID = UUID()
    
    var startValue: Double = 0.0
    var startLengthUnit: LengthUnit
    var endValue: Double = 0.0
    var endLengthUnit: LengthUnit
}

struct ConvertLengthView_Previews: PreviewProvider {
    static var previews: some View {
        ConvertLengthView()
    }
}
