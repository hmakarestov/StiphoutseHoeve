//
//  Horse.swift
//  HorseStable
//
//  Created by Student on 30/12/2019.
//  Copyright © 2019 smartmobile. All rights reserved.
//

import Foundation

enum Gender :Int, Decodable {

    case MALE
    case FEMALE
    case UNSPECIFIED
    case OTHER
}



public class Horse : Decodable {
    
     let id: Int
     let name: String
     let race: String
     let lifeNumber : String
     let chipNumber : String
     let birthDate : Date
     let gender : Gender
     let medicalReports : [MedicalReport]
     let owners : [User]
      
      
     init (id:Int, name:String,race:String,lifeNumber: String, chipNumber:String, birthDate : Date, gender:Gender, medicalReports: [MedicalReport] , owners : [User]) {
     
          self.id = id
          self.name = name
          self.race = race
         self.lifeNumber = lifeNumber
         self.chipNumber = chipNumber
         self.birthDate = birthDate
          self.gender = gender
         
         
          self.medicalReports = medicalReports
          self.owners = owners
         //to be fixed
        //  self.vaccinated = vaccinated
      }

    
}
