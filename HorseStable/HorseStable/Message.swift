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
          case GET_FACILITIES
          case ADD_RESERVATION
          case REMOVE_RESERVATION

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

          /* NOTICES */
          case CREATE_NOTICE
          case GET_NOTICE
          case UPDATE_NOTICE
          case  DELETE_NOTICE
          case GET_ALL_NOTICES
          case GET_NOTICES_FROM_USER


          case CREATE_CREDENTIALS
          case DELETE_CREDENTIALS
          case AUTHENTICATE
          case VERIFY_TOKEN
}


public class Message<T: Decodable> : Decodable {
    
    var type: MessageType?
    var model : T?
    var feedback : String?;
    init(type:MessageType,model:T,feedback : String) {
        self.type = type
        self.model = model
        self.feedback = feedback
    }
    
}
