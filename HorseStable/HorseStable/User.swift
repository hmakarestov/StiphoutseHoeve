//
//  User.swift
//  HorseStable
//
//  Created by Student on 09/01/2020.
//  Copyright © 2020 smartmobile. All rights reserved.
//

import Foundation

enum Role : String, Decodable {

    case USER
    case ADMIN
}

class User : Decodable{
    // properties
    var id: Int?
    //var username: String
    var firstName: String?
    var middleName: String?
    var lastName: String?
    var username: String?
   // var password: String
    var role: Role?
    var gender: Gender?
    var birthdate: Date?
    //var image: String

    //constructor
    init(id: Int, firstName: String, middleName: String, lastName: String, username: String, role: Role, gender: Gender, birthdate: Date){
        self.id = id
      //  self.username = username
        self.firstName = firstName
        self.middleName = middleName
        self.lastName = lastName
        self.username = username
    //    self.password = password
        self.role = role
        self.gender = gender
        self.birthdate = birthdate
      //  self.image = image
    }
}
