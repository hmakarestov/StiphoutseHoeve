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
    var id: Int
    var title: String
    var description: String
    var date: Date
    var facility: Facility
    var user: User
    
    // constructor
    init(id: Int, title: String, description: String, date: Date, facility: Facility, user: User){
        self.id = id
        self.title = title
        self.description = description
        self.date = date
        self.facility = facility
        self.user = user
    }
}
