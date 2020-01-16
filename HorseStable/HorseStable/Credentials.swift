//
//  Credentials.swift
//  HorseStable
//
//  Created by Student on 16/01/2020.
//  Copyright © 2020 smartmobile. All rights reserved.
//

import Foundation

class Credentials{
    // properties
    var userId: Int
    var username: String
    var password: String

    //constructor
    init(username: String, password: String, userId: Int){
        self.username = username
        self.password = password
        self.userId = userId
    }
}
