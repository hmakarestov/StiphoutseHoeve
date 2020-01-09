//
//  HorsesViewController.swift
//  HorseStable
//
//  Created by Student on 09/01/2020.
//  Copyright © 2020 smartmobile. All rights reserved.
//

import UIKit

class HorsesViewController: UIViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         
         return self.filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "horseCell", for: indexPath)
        cell.textLabel?.text =  "Name: \(self.filteredData[indexPath.row].name) "
        cell.detailTextLabel?.text = String(self.filteredData[indexPath.row].medicalReports[0].description )
        cell.imageView?.image = selectedImage//UIImage(named: "horse")
        
        return cell
                    
    }
    
   
    
    
    @IBAction func btnNotVaccined(_ sender: Any) {
        self.filteredData = horses.filter { !$0.vaccinated } // or !$0.vaccinated for the second option
        self.tableView.reloadData()
        print(horses.count)
        print(filteredData.count)
        print(filteredData[0].name)
        print("Not Vaccined")
        
    }
    
    @IBAction func btnVaccined(_ sender: Any) {
        filteredData = horses.filter { $0.vaccinated } // or !$0.vaccinated for the second option
        self.tableView.reloadData()
        print(horses.count)
        print(filteredData.count)
        print(filteredData[0].name)
        print(filteredData[1].name)

        print(" Vaccined")
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    var selectedName:String?
    var selectedDescription:String?
    var selectedImage = UIImage(named: "horse")
       //list of all horses vaccined/not vaccined
    var horses = [Horse] ()
    var filteredData = [Horse]()
       
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        let numbers = 0...0
            
            let medRep = MedicalReport(id: 1,description: "Flu: Vaccinated, Decontamination: Vaccinated",dateOfTreatment: Date())
            
            var medicalReports = [MedicalReport] ()
            medicalReports.append(medRep)
        
            for _ in numbers{
                
                let horse = Horse(id: 1,name: "Angel",race: "White",gender: Gender.MALE ,medicalReports: medicalReports, vaccinated : false)
                let horse2 = Horse(id: 2,name: "Rambo",race: "White",gender: Gender.MALE ,medicalReports: medicalReports, vaccinated : true)
                let horse3 = Horse(id: 3,name: "Toro",race: "White",gender: Gender.MALE ,medicalReports: medicalReports, vaccinated : true)
                
               // print(medRep.description)
                
                horses.append(horse);
                horses.append(horse2);
                horses.append(horse3);
                filteredData = horses
               self.tableView.reloadData()
                
                
               tableView.estimatedRowHeight = 100
                tableView.rowHeight = UITableView.automaticDimension

        // Do any additional setup after loading the view.
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
}

extension HorsesViewController :  UITableViewDelegate, UITableViewDataSource {
    

    func numberOfSections(in tableView: UITableView) -> Int {
          // #warning Incomplete implementation, return the number of sections
          return 1
      }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
               
               //pass data to next view s
               selectedName = self.filteredData[indexPath.row].name
               for medR in self.filteredData[indexPath.row].medicalReports {
                   selectedDescription = medR.description
                   
               }
           print("index row clicked")
               self.performSegue(withIdentifier: "aHorse", sender: self)
           }
           
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           
                if segue.identifier == "aHorse" {
                    let destinationViewController = segue.destination as!   OneHorseViewController
                   destinationViewController.name = selectedName!
                   print(selectedDescription!)
                    //pass image
                    destinationViewController.newImage = selectedImage!
                   
                   if selectedDescription != nil {
                       print("Contains a value!")
                       // destinationViewController.labelDescription.text = selectedDescription
                   } else {
                       print("Doesn’t contain a value.")
                   }

                   for medR in destinationViewController.medicalReports {
                       medR.description = selectedDescription!
                       print(medR.description)
                   }
               }
           }
           
      
    
    
}
