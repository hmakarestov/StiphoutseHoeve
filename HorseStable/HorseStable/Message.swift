//
//  MessageType.swift
//  HorseStable
//
//  Created by Student on 30/12/2019.
//  Copyright © 2019 smartmobile. All rights reserved.
//

import Foundation

enum MessageType : Int,Decodable {
   case CREATE_HORSE
   case CREATE_USER
}
public class Message<T: Decodable> : Decodable {
    
    var type: MessageType
    var model : T
    init(type:MessageType,model:T) {
        self.type = type
        self.model = model
    }
    
}
