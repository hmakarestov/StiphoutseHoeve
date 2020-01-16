//
//  Reservation.swift
//  HorseStable
//
//  Created by Student on 16/01/2020.
//  Copyright © 2020 smartmobile. All rights reserved.
//

import Foundation

class Reservation : Decodable{
    // properties
    var id: Int
    var dateTimeRange: DateTimeRange
    var user: User

    //constructor
    init(id: Int, dateTimeRange: DateTimeRange, user: User){
        self.id = id
        self.dateTimeRange = dateTimeRange
        self.user = user
    }
}
