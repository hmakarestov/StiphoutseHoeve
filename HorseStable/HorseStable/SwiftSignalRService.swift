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
            print(data.model)
            self.horses.append(data.model)
            for h in self.horses {
                print("Hello, \(h.name)!")
            }
        })
         connection.start()
        print(url)
        
      

//        // Connect to the service
//        let hubConnection = HubConnection(withUrl: string)
//
//        guard  let chat = hubConnection.createHubProxy(hubName: "chat") else { return  }
//
//        chat.on(eventName: "BroadcastMessage") { (args) in
//          print(args)
//        }
//
//        // register for connection lifecycle events
//        hubConnection.started = {
//            print("Connected")
//        }
//
//        hubConnection.reconnecting = {
//            print("Reconnecting...")
//        }
//
//        hubConnection.reconnected = {
//            print("Reconnected.")
//        }
//
//        hubConnection.closed = {
//            print("Disconnected")
//        }
//
//        hubConnection.connectionSlow = { print("Connection slow...") }
//
//        hubConnection.error = { error in
//          print("Error")
//        }
//
//        hubConnection.start()
//
    }
    
    
   
    private func handleMessage(_ message: String, from user: String) {
        // Do something with the message.
            print(">>> \(user): \(message)")
        
    }
}
