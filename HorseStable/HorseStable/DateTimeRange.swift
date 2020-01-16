//
//  DateTimeRange.swift
//  HorseStable
//
//  Created by Student on 16/01/2020.
//  Copyright © 2020 smartmobile. All rights reserved.
//

import Foundation

class DateTimeRange : Decodable{
    // properties
    var id: Int
    var startDateTime: Date
    var endDateTime: Date

    //constructor
    init(id: Int, startDateTime: Date, endDateTime: Date){
        self.id = id
        self.startDateTime = startDateTime
        self.endDateTime = endDateTime
    }
}
