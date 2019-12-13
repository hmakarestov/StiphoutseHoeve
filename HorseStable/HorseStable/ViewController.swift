//
//  ViewController.swift
//  HorseStable
//
//  Created by Student on 06/12/2019.
//  Copyright © 2019 smartmobile. All rights reserved.
//

import UIKit
import SwiftSignalRClient// pod library
import SwiftR

class ViewController: UIViewController {

    var horses : [Horse] = []
    //var connectionService
    override func viewDidLoad() {
        //http://i409458core.venus.fhict.nl/horseHub link to server
      guard let url = URL(string:"http://i409458core.venus.fhict.nl/horseHub") else { return  }
        let connection = SignalRService(url: url)
        
       // let connectionR = SwiftRService()

        //        let connection = SignalR("http://localhost:5000")
//        connection.transport = .webSockets
//        let complexHub = Hub("horseHub")
//        complexHub.on("BroadcastMessage") { args in
//            let m: Message<Horse> = args![0] as! Message<Horse>
//            print(m)
//            print("yes")
//        }
//
//        connection.addHub(complexHub)
//        connection.start()
    }

}

