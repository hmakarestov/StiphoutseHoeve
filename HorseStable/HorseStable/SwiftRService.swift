//
//  SwiftRService.swift
//  HorseStable
//
//  Created by Student on 13/12/2019.
//  Copyright © 2019 smartmobile. All rights reserved.
//

import Foundation
import SwiftR
public class SwiftRService
{
    let connection = SignalR("http://localhost:5000")

    let complexHub = Hub("horseHub")
    
    public init() {
        print("URLLLL")
        
        complexHub.on("BroadcastMessage") { args in
            let m: Message<Horse> = args![0] as! Message<Horse>
            print(args!)
            print("Connecting")
            print(m.model)
        }

        connection.addHub(complexHub)
        connection.start()
    }
}
