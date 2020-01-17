//
//  MessageType.swift
//  HorseStable
//
//  Created by Student on 30/12/2019.
//  Copyright © 2019 smartmobile. All rights reserved.
//

import Foundation

enum MessageType : String,Decodable {
         case CREATE_HORSE
          case GET_HORSE
          case UPDATE_HORSE
          case DELETE_HORSE
          case GET_HORSES_ASSIGNED_TO_USER
          case REMOVE_HORSE_FROM_USER
          case ADD_HORSE_TO_USER

          /* USERS */
          case CREATE_USER
          case GET_USER
          case UPDATE_USER
          case DELETE_USER

          /* FACILITIES */
          case CREATE_FACILITY
          case GET_FACILITY
          case UPDATE_FACILITY
          case DELETE_FACILITY

          /* STALLS */
          case CREATE_STALL
          case GET_STALL
          case UPDATE_STALL
          case DELETE_STALL

          /* POSTS */
          case CREATE_POST
          case GET_POST
          case UPDATE_POST
          case DELETE_POST

          case ADD_RESERVATION
          case REMOVE_RESERVATION

          case AUTHENTICATE
}


public class Message<T: Decodable> : Decodable {
    
    var type: MessageType?
    var model : T?
    init(type:MessageType,model:T) {
        self.type = type
        self.model = model
    }
    
}
