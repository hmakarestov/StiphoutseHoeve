//
//  SwiftSignalRService.swift
//  HorseStable
//
//  Created by Student on 11/12/2019.
//  Copyright © 2019 smartmobile. All rights reserved.
//

import Foundation
import SwiftSignalRClient


public class SignalRService {
    
    var horses : [Horse] = []
    let connection : SwiftSignalRClient.HubConnection
            
    
    public init(url: URL) {
        connection = HubConnectionBuilder(url: url).withLogging(minLogLevel: .error).build()

        connection.on(method: "BroadcastMessage", callback: { (data: Message<Horse>) in
            do {
                 self.handleMessage(data)
            } catch {
                    print(error)
            }
            
        })
         connection.start()
        print(url)
    }
   
    private func handleMessage(_ data : Message<Horse>) {
        // Do something with the message.
        
        print("Successful printing \(data.model)")
        self.horses.append(data.model)
        
        //test fetching of name 
        for h in self.horses {
            print("Hello, \(h.name)!")
        }
        
    }
}
