//
//  Stall.swift
//  HorseStable
//
//  Created by Student on 22/01/2020.
//  Copyright © 2020 smartmobile. All rights reserved.
//

import Foundation
public class Stall : Decodable{
    var id : Int
    var horse : Horse
    var available : Bool
    
    init(id : Int, horse : Horse, available : Bool) {
        self.id = id;
        self.horse = horse
        self.available = available
    }
    
}
