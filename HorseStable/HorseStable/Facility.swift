//
//  Facility.swift
//  HorseStable
//
//  Created by Student on 16/01/2020.
//  Copyright © 2020 smartmobile. All rights reserved.
//

import Foundation

class Facility{
    // properties
    var id: Int
    var name: String
    var reservable: Bool
    var reservations: [Reservation]
    var unavailableTimeSlots: [DateTimeRange]

    //constructor
    init(id: Int, name: String, reservable: Bool, reservations: [Reservation], unavailableTimeSlots: [DateTimeRange]){
        self.id = id
        self.name = name
        self.reservable = reservable
        self.reservations = reservations
        self.unavailableTimeSlots = unavailableTimeSlots
    }
}
