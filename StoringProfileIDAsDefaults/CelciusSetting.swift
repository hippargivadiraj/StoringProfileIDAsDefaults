//
//  CelciusSetting.swift
//  StoringProfileIDAsDefaults
//
//  Created by Vadiraj Hippargi on 2/14/21.
//

import Foundation
import Combine

class CelciusSetting: ObservableObject {
    @Published var storeCelcius : Double = 0.0
    
 //This is to make sure you dont mess up ion key String, so create as a contant
    let userDefaultKey = "storedCelcius"
    
    var subscriptions = Set<AnyCancellable>() // this is a subscription that is cancellable
    
    init(){
        
        // Here you get the value from user defaults when this class initializes
        storeCelcius = UserDefaults.standard.double(forKey: userDefaultKey)
        
        // Now here since storeCelcius is "PUBLISHED" property, use combine top gert it when it changes and then store it in the Defaults
        $storeCelcius
            .dropFirst() //you dont want the first value baecuse, first value is what set by class which is 0.0
            .debounce(for: .milliseconds(500), scheduler: DispatchQueue.main) // this is shows how fast to recat to value changes
            .sink { value in
                print("This is the saved Value \(value)")
                UserDefaults.standard.setValue(value, forKey: self.userDefaultKey)
            }
            .store(in: &subscriptions)
        
    }
    
}
