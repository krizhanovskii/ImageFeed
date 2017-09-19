//
//  Constants.swift
//  KKImageFeed
//
//  Created by Krizhanovskii on 9/19/17.
//  Copyright © 2017 krizhanovskii. All rights reserved.
//

import Foundation
import UIKit
import SWSkelethon

struct Constants {
    
    static let serverUrl = "https://pixabay.com"
    
    // Keys
    enum Keys: String {
        case firstLaunch = "FirstLaunch"
        case lastlang = "LastLang"
        case token = "Token"
        
        func getValue() -> Any? {
            let _value = UserDefaults.standard.value(forKey: self.rawValue)
            Log.info.log("Getting value for key: <\(self.rawValue)> -> <\(_value)>")
            return _value
        }
        
        func setValue(_ value:Any) {
            Log.info.log("Set value: <\(value)> for key: <\(self.rawValue)>")
            UserDefaults.standard.set(value, forKey: self.rawValue)
        }
        
        func removeValue() {
            Log.info.log("Remove value for key: <\(self.rawValue)>")
            UserDefaults.standard.removeObject(forKey: self.rawValue)
        }
    }
}
