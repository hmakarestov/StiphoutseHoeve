//
//  ViewController.swift
//  HorseStable
//
//  Created by Student on 06/12/2019.
//  Copyright © 2019 smartmobile. All rights reserved.
//

import UIKit
import SwiftSignalRClient// pod library


class ViewController: UIViewController {

    //var connectionService
    override func viewDidLoad() {
        //http://i409458core.venus.fhict.nl/horseHub link to server
        guard let url = URL(string:"http://localhost:5000/horseHub") else { return  }
        let connection = SignalRService(url: url)
    
    
    }

}

