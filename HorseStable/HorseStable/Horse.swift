//
//  Horse.swift
//  HorseStable
//
//  Created by Student on 12/12/2019.
//  Copyright © 2019 smartmobile. All rights reserved.
//

import Foundation

enum Gender :Int, Decodable {

    case MALE
    case FEMALE
    case UNSPECIFIED
    case OTHER
}


public class Horse :  Decodable{
    
    var id : Int
    var name : String
    var race : String
    var gender : Gender
    var medicalReports : [MedicalReport]
    
    
    init (id:Int, name:String,race:String,gender:Gender, medicalReports: [MedicalReport] ) {
        
        self.id = id
        self.name = name
        self.race = race
        self.gender = gender
        self.medicalReports = medicalReports
        
    }
    
//    public int id { get; set; }
//    public string name { get; set; }
//    public string race { get; set; }
//    public Gender gender { get; set; }
//    public List<MedicalReport> medicalReports { get; set; }
//
//    public Horse() { }
//
//    public Horse(int id, string name, string race, Gender gender, List<MedicalReport> medicalReports)
//    {
//        this.id = id;
//        this.name = name;
//        this.race = race;
//        this.gender = gender;
//        this.medicalReports = medicalReports;
//    }
    
}
