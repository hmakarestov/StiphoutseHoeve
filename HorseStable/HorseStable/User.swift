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

class User{
    // properties
    var id: Int
    var username: String
    var firstName: String
    var middleName: String
    var lastName: String
    var email: String
    var password: String
    var role: Role
    var gender: Gender
    var birthdate: Date
    var image: String

    //constructor
    init(id: Int, username: String, firstName: String, middleName: String, lastName: String, email: String, password: String, role: Role, gender: Gender, birthdate: Date, image: String){
        self.id = id
        self.username = username
        self.firstName = firstName
        self.middleName = middleName
        self.lastName = lastName
        self.email = email
        self.password = password
        self.role = role
        self.gender = gender
        self.birthdate = birthdate
        self.image = image
    }
}
