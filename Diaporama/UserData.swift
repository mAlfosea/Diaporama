//
//  UserData.swift
//  Diaporama
//
//  Created by Admin on 24/05/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation

class UserData {
    
    private static var instance: UserData? = nil
    
    static func getInstance () -> UserData {
        if instance == nil {
            instance = UserData()
        }
        return instance!
    }
    
    private init() {
        UserDefaults.standard.register(defaults: ["ANIM-SPEED" : 0.2])
    }
    
    var animSpeed: Double {
        get {
            return UserDefaults.standard.double(forKey: "ANIM-SPEED")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "ANIM-SPEED")
        }
    }
    
}
