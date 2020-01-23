//
//  Credentials.swift
//  HorseStable
//
//  Created by Student on 16/01/2020.
//  Copyright © 2020 smartmobile. All rights reserved.
//

import Foundation

class Credentials : Decodable{
    // properties
    var id: Int
    var email: String
    var password: String

    //constructor
    init(email: String, password: String, id: Int){
        self.email = email
        self.password = password
        self.id = id
    }
}
