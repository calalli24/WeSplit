//
//  ContentView.swift
//  WeSplit
//
//  Created by parol-12345 on 3/6/22.
//

import SwiftUI

struct ContentView: View {
    @State private var CheckAmount = ""
    @State private var NumberOfPeople = 2
    @State private var TipPercentage = 20
    
    let TipPercentages = [Int](1...100)
    
    
    var totalPerPerson: Double{
        let Amount = Double(CheckAmount) ?? 0
        let PeopleCount = Double(NumberOfPeople + 2)
        let tipSelection = Double(TipPercentage)
        
        let Tip = Amount / 100 * tipSelection
        let GrandTotal = Amount + Tip
        let AmountPerPerson = GrandTotal / PeopleCount
        
        return AmountPerPerson
    }
    
    var Check: Double{
        let Amount = Double(CheckAmount) ?? 0
        let tipSelection = Double(TipPercentage)
        
        let Tip = Amount / 100 * tipSelection
        let GrandTotal = Amount + Tip
        
        return GrandTotal
    }
    
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Amount", text:$CheckAmount )
                        .keyboardType(.decimalPad)
                    
                    Picker("Number of people",selection:$NumberOfPeople){
                        ForEach(2..<100){
                            Text("\($0) people ")
                        }
                    }
            }
                
                Section(header: Text("How much tip do u wanna leave?")){
                    Picker("Tip percentage",selection:$TipPercentage){
                        ForEach(0..<TipPercentages.count){
                            Text("\(self.TipPercentages[$0])%")
                        }
                    }
                }
                
                Section(header: Text("Amount per person")){
                    Text("\(totalPerPerson)")
                }
                
                Section(header: Text("Total check")) {
                    Text("\(Check)")
                }
        }
            .navigationTitle("WeSplit")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}
