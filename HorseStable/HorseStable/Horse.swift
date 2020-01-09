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
    
     var id : Int
     var name : String
     var race : String
     var gender : Gender
     var medicalReports : [MedicalReport]
     var vaccinated:Bool
     
     
    init (id:Int, name:String,race:String,gender:Gender, medicalReports: [MedicalReport] , vaccinated : Bool) {
         
         self.id = id
         self.name = name
         self.race = race
         self.gender = gender
         self.medicalReports = medicalReports
        //to be fixed
         self.vaccinated = vaccinated
     }

    
}
