//
//  ContentView.swift
//  StoringProfileIDAsDefaults
//
//  Created by Vadiraj Hippargi on 2/14/21.
//

import SwiftUI

struct ContentView: View {
    //When you restart, this always gets you zero cecius.
    //we want to use Appstorage to store current value and retrive when app restars again
//COMMENTED    @State private var celsius: Double = 0.0
    @StateObject var celcius = CelciusSetting()
    var body: some View {
        VStack {
            Slider(value: $celcius.storeCelcius, in: -100...100, step: 0.1)
            Text("\(celcius.storeCelcius) Celsius is \(celcius.storeCelcius * 9 / 5 + 32 )  Fahrenheight")
                .padding()
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    @StateObject var celcius = CelciusSetting()
//    static var previews: some View {
//        ContentView(celcius: celcius.$storeCelcius )
//    }
//}
