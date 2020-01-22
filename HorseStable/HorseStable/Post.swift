//
//  Post.swift
//  HorseStable
//
//  Created by Student on 21/01/2020.
//  Copyright © 2020 smartmobile. All rights reserved.
//

import Foundation

enum PostType : String,Decodable{
    case ADMIN_NOTICE
    case POST
}
public class Post : Decodable {
    var id : Int?
    var type : PostType?
    var imageUrl : String?
    var description: String?
    var dateTime : Date?
    var user : User?
    var comments : [Comment]?
    
    init(id : Int, type : PostType, imageUrl : String, description : String, dateTime : Date, user : User, comments : [Comment]) {
        self.id = id
        self.type = type
        self.imageUrl = imageUrl
        self.description = description
        self.dateTime = dateTime
        self.user = user
        self.comments = comments
    }
}
