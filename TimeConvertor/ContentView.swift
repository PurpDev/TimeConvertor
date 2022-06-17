//
//  ContentView.swift
//  TimeConvertor
//
//  Created by Augustin Diabira on 16/06/2022.
//

import SwiftUI

struct ContentView: View {
    @State var initValue = 3.0
    @State var initUnit = ["second", "minute", "hour"]
    @State var unit = "minute"
    @State var toChosenUnitn = ["second", "minute", "hour"]
    @State var unitFinal = "minute"
    
    
    
    func secondToMinutes(unit: Double ) -> Double {
        
        let res =  unit / 60
        
        return res
    }
    
    func minutesToHours(unit: Double) -> Double {
        let res = (unit * 60) / 3600
        
        return res
    }
    
    func minutesToSecond(unit: Double) -> Double {
        let res = (unit / 60) * 3600
        
        return res
    }
    
    func secondToHours(unit: Double) -> Double {
        let res = unit / 3600
        
        return res
    }
    
    func hourToSecond(unit: Double) -> Double {
        let res = (unit * 60) * 60
        
        return res
    }
    
    func hourToMinute(unit: Double) -> Double {
        let res = unit * 60
        return res
    }
    
    
   
    var body: some View {
        NavigationView {
            Form{
                //Valeur de base
                Section(header: Text("Insert a value to convert ")){
                    TextField("", value: $initValue, format: .number)
                }
                
                //Unité de base
                Section(header: Text("Unit from")) {
                    Picker("", selection: $unit) {
                        ForEach(initUnit, id: \.self) {
                            Text("\($0)")
                        }
                    }.pickerStyle(.segmented)
                }
                
                //Unité finale
                Section(header: Text("Final Unit")) {
                    Picker("", selection: $unitFinal) {
                        ForEach(toChosenUnitn, id:\.self) {
                            Text("\($0)")
                        }
                    }.pickerStyle(.segmented)
                }
                
                Section{
                    if unit == "second" && unitFinal == "minute"{
                        let res = secondToMinutes(unit: initValue)
                        Text("\(res, specifier: "%0.2f") minutes ")
                    }else if unit == "minute" && unitFinal == "hour"{
                        let res = minutesToHours(unit: initValue)
                        Text("\(res, specifier: "%0.2f") hours")
                    } else if unit == "minute" && unitFinal == "second"{
                        let res = minutesToSecond(unit: initValue)
                        Text("\(res, specifier: "%0.2f") seconds")
                    }else if unit == "second" && unitFinal == "hour"{
                        let res = secondToHours(unit: initValue)
                        Text("\(res, specifier: "%0.2f") hours")
                    }else if unit == "hour" && unitFinal == "second"{
                        let res = hourToSecond(unit: initValue)
                        Text("\(res, specifier: "%0.2f") seconds")
                    } else if unit == "hour" && unitFinal == "minute" {
                        let res = hourToMinute(unit: initValue)
                        Text("\(res, specifier: "%0.2f") minutes")
                    } else {
                        Text("Can't convert value \(unit) to \(unitFinal)")
                    }
                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .preferredColorScheme(.dark)
            
        }
    }
}
