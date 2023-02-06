//
//  ContentView.swift
//  UnitConverter
//
//  Created by Kalle Pohjanjoki on 6.2.2023.
//

import SwiftUI

struct ContentView: View {
	@State private var unitToConvert = "Celsius"
	@State private var unitToConcvertTo = "Fahrenheit"

	@State private var degreeToConvert: Double = 0
	
	var convertDegrees: Double {
		if (unitToConvert == "Celsius" && unitToConcvertTo == "Fahrenheit") {
			return degreeToConvert * 2 + 30
		}
		
		else if (unitToConvert == "Celsius" && unitToConcvertTo == "Kelvin") {
			return degreeToConvert + 273.15
		}
		
		else if (unitToConvert == "Fahrenheit" && unitToConcvertTo == "Celsius") {
			return (degreeToConvert - 32) / 1.8
			
		}
		
		else if (unitToConvert == "Fahrenheit" && unitToConcvertTo == "Kelvin") {
			return (degreeToConvert - 32) / 1.8 + 273.15
			
		}
		
		else if (unitToConvert == "Kelvin" && unitToConcvertTo == "Celsius") {
			return degreeToConvert - 273.15
			
		}
		
		else if (unitToConvert == "Kelvin" && unitToConcvertTo == "Fahrenheit") {
			return degreeToConvert * 1.8 - 459.67
			
		}
		
		return 0.0
	}
	
	let temperatureUnits = ["Celsius", "Fahrenheit", "Kelvin"]
	
	
	
	var body: some View {
		Form {
			Section {
				Picker("Choose unit to convert", selection: $unitToConvert) {
					ForEach(temperatureUnits, id: \.self) {i in
						Text(i)
					}
				}
				
				Picker("Choose unit to convert to", selection: $unitToConcvertTo) {
					ForEach(temperatureUnits, id: \.self) {i in
						Text(i)
					}
				}
			}
			
			Section {
				
				TextField("How many degrees do you want to convert?", value: $degreeToConvert, format: .number)
					.keyboardType(.decimalPad)
				
				Text(convertDegrees, format: .number)

			}
			
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
