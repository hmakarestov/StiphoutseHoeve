//
//  Message.swift
//  HorseStable
//
//  Created by Student on 12/12/2019.
//  Copyright © 2019 smartmobile. All rights reserved.
//

import Foundation

enum MessageType : Int,Decodable {
   case CREATE_HORSE
   case CREATE_USER
}
public class Message<T: Decodable> : Decodable {
    
    var messageType: MessageType
    var model : T
    init(messageType:MessageType,model:T) {
        self.messageType = messageType
        self.model = model
    }
    
}


//public class Message<T>
//{
//    public MessageType MessageType { get; set; }
//    public T Model { get; set; }
//
//    public Message() { }
//
//    public Message(MessageType MessageType, T Model)
//    {
//        this.MessageType = MessageType;
//        this.Model = Model;
//    }
//}
