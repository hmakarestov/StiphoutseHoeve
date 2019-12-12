//
//  Notification.swift
//  HorseStable
//
//  Created by Student on 12/12/2019.
//  Copyright © 2019 smartmobile. All rights reserved.
//

import Foundation

class Notification{
    // properties
    var Title: String
    var Description: String
    var theDate: String
    
    // constructor
    init(name: String, description: String){
        self.Title = name
        self.Description = description
        self.theDate = ""
    }
}
