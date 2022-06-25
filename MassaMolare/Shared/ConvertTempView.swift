//
//  ConvertTempView.swift
//  MassaMolare
//
//  Created by Luca Vigato on 22/06/22.
//

import SwiftUI

struct ConvertTempView: View {
    
    @State private var tempAmount = "0"
    @State private var selectionFrom = 0
    @State private var selectionTo = 1
    let tempUnits = ["Celsius", "Fahrenheit", "Kelvin"]
    
    var displayUnitConverted: Double {
        let formatter = NumberFormatter()
        let doubleTempAmount = formatter.number(from: tempAmount)?.doubleValue
        let unitSelectedFrom = tempUnits[selectionFrom]
        let unitSelectedTo = tempUnits[selectionTo]
        var converted: Double

        let fToC = ((doubleTempAmount ?? 0) - 32) * 5/9
        let fToK = ((doubleTempAmount ?? 0) - 32) * 5/9 + 273.15
        
        let kToC = (doubleTempAmount ?? 0) - 273.15
        let kToF = ((doubleTempAmount ?? 0) - 273.15) * 9/5 + 32
        
        let cToF = ((doubleTempAmount ?? 0) * 9/5) + 32
        let cToK = (doubleTempAmount ?? 0) + 273.15
        
        if unitSelectedFrom == "Celsius" && unitSelectedTo == "Fahrenheit" {
            converted = cToF
        }
        else if unitSelectedFrom == "Celsius" && unitSelectedTo == "Kelvin" {
            converted = cToK
        }
        else if unitSelectedFrom == "Fahrenheit" && unitSelectedTo == "Celsius" {
            converted = fToC
        }
        else if unitSelectedFrom == "Fahrenheit" && unitSelectedTo == "Kelvin" {
            converted = fToK
        }
        else if unitSelectedFrom == "Kelvin" && unitSelectedTo == "Celsius" {
            converted = kToC
        }
        else if unitSelectedFrom == "Kelvin" && unitSelectedTo == "Fahrenheit" {
            converted = kToF
        }
        else {
            converted = doubleTempAmount ?? 0
        }
        
        return converted

    }
    
    
    var body: some View {
        Form {
            Section {
                TextField("Amount", text: $tempAmount)
                    .keyboardType(.decimalPad)
                Picker("Pick", selection: $selectionFrom) {
                    ForEach(0..<tempUnits.count, id: \.self) {
                        Text("\(self.tempUnits[$0])")
                    }
                }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.vertical)
            }
            .keyboardType(.numberPad)
            Section(header: Text("Convert To: ")){
                Picker("Pick Unit", selection: $selectionTo) {
                    ForEach(0..<tempUnits.count, id: \.self) {
                        Text("\(self.tempUnits[$0])")
                    }
                }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.vertical)
            }
            Section {
                Text("\(displayUnitConverted, format: .number)")
            }
        }
    }
}

struct ConvertTempView_Previews: PreviewProvider {
    static var previews: some View {
        ConvertTempView()
    }
}
