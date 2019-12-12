//
//  MedicalReport.swift
//  HorseStable
//
//  Created by Student on 12/12/2019.
//  Copyright © 2019 smartmobile. All rights reserved.
//

import Foundation

public class MedicalReport : Decodable{
    
    var id: Int
    var description: String
    var dateOfTreatment: Date
    
    init (id: Int, description: String, dateOfTreatment: Date ) {
        self.id = id
        self.description = description
        self.dateOfTreatment = dateOfTreatment
    }
}
