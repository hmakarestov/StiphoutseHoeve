//
//  HorsesViewController.swift
//  HorseStable
//
//  Created by Student on 09/01/2020.
//  Copyright © 2020 smartmobile. All rights reserved.
//

import UIKit

class HorsesViewController: UIViewController {
    
    var backEnd = BackendHelper () 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         
         return self.horses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "horseCell", for: indexPath)
        cell.textLabel?.text =  "Name: \(self.horses[indexPath.row].name!) "
        cell.detailTextLabel?.text = String("Life Number: \(self.horses[indexPath.row].lifeNumber!)") + " " + "Chip Number: \(self.horses[indexPath.row].chipNumber!)"//medicalReports![0].description )
        cell.imageView?.image = selectedImage//UIImage(named: "horse")
        
        return cell
                    
    }
    
   
    
    
    @IBAction func btnNotVaccined(_ sender: Any) {
      //  self.filteredData = horses.filter { !$0.vaccinated } // or !$0.vaccinated for the second option
        self.tableView.reloadData()
        print(horses.count)
        print(filteredData.count)
        print(filteredData[0].name!)
        print("Not Vaccined")
        
    }
    
    @IBAction func btnVaccined(_ sender: Any) {
       //filteredData = horses.filter { $0.vaccinated } // or !$0.vaccinated for the second option
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
    var horseDescription : String = ""
       //list of all horses vaccined/not vaccined
    var horses = [Horse] ()
    var filteredData = [Horse]()
       
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Startttt")
    backEnd.getJSONHorses(completion:{ arrayHorses in
           print("Horses before assign: \(self.horses.count)")
           self.horses = arrayHorses
           self.tableView.reloadData()
           print("ArrayHorses: \(arrayHorses.count)")
           print("Horses After Assign: \(self.horses.count)")
           for h in self.horses {
               print(h.name as Any)
            print(h.medicalReports!.description as Any)
           }
        })
           print("Horses Outside Assign: \(self.horses.count)")
        
        //self.horses.append(horse.model!)
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        

        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension

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
        selectedName = self.horses[indexPath.row].name
        for medR in self.horses[indexPath.row].medicalReports! {
                selectedDescription = medR.description
            }
        
      
        
        horseDescription = "Life Number: \(self.horses[indexPath.row].lifeNumber!)\n" +
            "Chip Number:  \(self.horses[indexPath.row].chipNumber!)\n" +
            "Gender:  \(self.horses[indexPath.row].gender!)\n" +
        "Owners: \(self.horses[indexPath.row].owners!)\n"
        
        print("index row clicked")
        self.performSegue(withIdentifier: "aHorse", sender: self)
        }
           
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "aHorse" {
                let destinationViewController = segue.destination as!   OneHorseViewController
                destinationViewController.name = selectedName!
               // print(selectedDescription!)
                    //pass image
                destinationViewController.newImage = selectedImage!
            
        if selectedDescription != nil {
            print("Contains a value!")
            destinationViewController.medDescription = selectedDescription!
                }
        else {
            print("Doesn’t contain a value.")
            destinationViewController.medDescription = "No value at the moment"
                }
            
        if horseDescription != nil {
            print("Contains a value!")
            destinationViewController.horseDescription = horseDescription
                }
        else {
            print("Doesn’t contain a value.")
            destinationViewController.horseDescription = "No value at the moment"
                }
            
        }
    }
           
      
    
    
}
