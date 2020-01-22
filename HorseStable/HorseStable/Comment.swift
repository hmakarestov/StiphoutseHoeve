//
//  Comment.swift
//  HorseStable
//
//  Created by Student on 21/01/2020.
//  Copyright © 2020 smartmobile. All rights reserved.
//

import Foundation
public class Comment : Decodable{
    
    var id : Int
    var text : String
    var time : Date
    var user : User
    
    init( id: Int, text : String, time : Date, user : User) {
        self.id = id;
        self.text = text
        self.time = time
        self.user = user
    }
}
