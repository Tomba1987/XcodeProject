//
//  ContentView.swift
//  Challenge Day
//
//  Created by Tomislav Tomic on 03/11/2020.
//

import SwiftUI

struct ContentView: View {
    
    @State private var userInput = ""
    @State private var userType = 0
    @State private var outputType = 0
//  @State private var rez = 0
    
    let units: [UnitLength] = [.millimeters, .centimeters, .decimeters, .meters]
    
    let type = ["mm", "cm", "dm", "m"]
    
    
    var rezultat: Double {
        
        let start = units[userType]
        let end = units[outputType]
        let rez = Double(userInput) ?? 0
        
        
        let incomingValue = Measurement(value: Double(rez) , unit: start)
        
        let outgoingValue = incomingValue.converted(to: end)
        
        

        return outgoingValue.value
    }
    
    
    func restart() {
        
        self.userInput = ""
        self.userType = 0
        self.outputType = 0
        
    }
    
    var body: some View {
        
        NavigationView {
            
            Form {
                
                Section(header: Text("User input")) {
                    
                    TextField("Enter your number", text: $userInput)
                        .keyboardType(.decimalPad)
                    
                    Text("\(userInput) \(type[userType])")
                        .foregroundColor(.purple)
                    
                }
                .padding()
                
                Section(header: Text("Your unit type")) {
                    
                    Picker("Tvoja mjerna jedinica", selection: $userType) {
                        ForEach(0 ..< type.count) {
                            Text("\(type[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                }
                .padding()
                
                Section(header: Text("Desired unit type")) {
                    
                    Picker("Your unit type", selection: $outputType) {
                        ForEach(0 ..< type.count) {
                            Text("\(type[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                }
                .padding()
                
                Section(header: Text("Result")) {
                    
                    Text("\(rezultat, specifier: "%.3f") \(type[outputType])")
                        .foregroundColor(.purple)
                    
                }
                .padding()
                
            }
            .navigationBarTitle(Text("Pretvaranje"), displayMode: .inline)
            .navigationBarItems(
                trailing:
                    Button("Restart") { restart() }

            )
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
