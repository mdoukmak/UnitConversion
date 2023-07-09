//
//  ContentView.swift
//  UnitConversion
//
//  Created by Muhammad Doukmak on 7/7/23.
//

import SwiftUI

struct ContentView: View {

    @State private var input: Double = 0.0
    @State private var inputUnit: String = "Meters"
    @State private var outputUnit: String = "Feet"

    private var toFeet: [String: Double] = [
        "Meters": 3.28,
        "Feet": 1.0
    ]

    private var feetToMeters: Double = 0.3

    private var output: Double {
        let feet = input * toFeet[inputUnit]!
        if outputUnit == "Feet" {
            return feet
        } else {
            return feet * feetToMeters
        }
    }

    private let units: [String] = ["Meters", "Feet"]

    var body: some View {
        VStack {
            Text("UnitConversion")
                .prominentTitle()
                .frame(maxWidth: .infinity)
            Form {
                Section(header: Text("Input")) {
                    TextField("Input", value: $input, format: .number)
                    Picker("Unit", selection: $inputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section(header: Text("Output")) {
                    Picker("Unit", selection: $outputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    Text(output, format: .number)
                }
            }
            Spacer()
        }
        .background(Color(UIColor.secondarySystemBackground))
        .ignoresSafeArea(edges: .bottom)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View {
    func prominentTitle() -> some View {
        modifier(ProminentTitle())
    }
}

struct ProminentTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.blue)
            .font(.largeTitle.bold())
    }
}
