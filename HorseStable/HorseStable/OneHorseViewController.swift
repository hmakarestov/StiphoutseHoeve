//
//  OneHorseViewController.swift
//  HorseStable
//
//  Created by Student on 05/01/2020.
//  Copyright © 2020 smartmobile. All rights reserved.
//

import UIKit

class OneHorseViewController: UIViewController {

    @IBOutlet weak var horseAvatar: UIImageView!
    var newImage: UIImage!
    @IBOutlet weak var labelDescription: UILabel!
    var name: String = ""
    let medRep = MedicalReport(id: 1,description: "Flu: Vaccinated, Decontamination: Vaccinated",dateOfTreatment: Date())
    
    var medicalReports = [MedicalReport] ()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = name
        // Do any additional setup after loading the view.
        //for medR in medicalReports {
        medicalReports.append(medRep)
        labelDescription.text = medRep.description
        
        horseAvatar.image = newImage
    //    }
    
        
        // Do any additional setup after loading the view.
        let session = URLSession.shared
        let url = URL(string: "http://localhost:8082/horse")!
    
        
        let task = session.dataTask(with: url) { data, response, error in
        
        
            if error != nil || data == nil {
                print("Client error!")
                return
            }


            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                print(json)
                
            } catch {
                print("JSON error: \(error.localizedDescription)")
            }
        }

        task.resume()
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
