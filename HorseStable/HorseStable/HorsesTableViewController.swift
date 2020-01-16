//
//  HorsesTableViewController.swift
//  HorseStable
//
//  Created by Student on 30/12/2019.
//  Copyright © 2019 smartmobile. All rights reserved.
//

import UIKit

class HorsesTableViewController: UITableViewController {

    var selectedName:String?
    var selectedDescription:String?
    var selectedImage:String?
    //list of all horses vaccined/not vaccined
    var horses = [Horse] ()
    var filteredData = [Horse]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //create a button or any UIView and add to subview
        let button=UIButton.init(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.frame.size = CGSize(width: 100, height: 50)
        self.view.addSubview(button)

        //set constrains
        button.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11.0, *) {
             button.rightAnchor.constraint(equalTo: tableView.safeAreaLayoutGuide.rightAnchor, constant: -90).isActive = true
             button.bottomAnchor.constraint(equalTo: tableView.safeAreaLayoutGuide.bottomAnchor, constant: -650).isActive = true
        } else {
             button.rightAnchor.constraint(equalTo: tableView.layoutMarginsGuide.rightAnchor, constant: 0).isActive = true
             button.bottomAnchor.constraint(equalTo: tableView.layoutMarginsGuide.bottomAnchor, constant: -10).isActive = true
        }
       
        let numbers = 0...1
        
        let medRep = MedicalReport(id: 1,description: "Flu: Vaccinated, Decontamination: Vaccinated",dateOfTreatment: Date())
        
        var medicalReports = [MedicalReport] ()
        medicalReports.append(medRep)
    
        for _ in numbers{
            
           // let horse = Horse(id: 1,name: "Angel",race: "White",gender: Gender.MALE ,medicalReports: medicalReports, vaccinated : false)
          //  let horse2 = Horse(id: 1,name: "Rambo",race: "White",gender: Gender.MALE ,medicalReports: medicalReports, vaccinated : true)
            
           // print(medRep.description)
            
          //  horses.append(horse);
          //  horses.append(horse2);
            self.tableView.reloadData()

        }
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.horses.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "horseCell", for: indexPath)
       // let buttonCell = tableView.dequeueReusableCell(withIdentifier: "buttonCell", for: indexPath)
            
        cell.textLabel?.text =  "Name: \(self.horses[indexPath.row].name) "
         //Name:  \(self.horses[indexPath.row].name), \(self.horses[indexPath.row].name)"
        cell.detailTextLabel?.text = String(self.horses[indexPath.row].medicalReports[0].description )
        
        cell.imageView?.image = UIImage(named: "horse")
        
       
       // tableView.deselectRow(at: indexPath, animated: true)

        return cell 
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //pass data to next view s
        selectedName = self.horses[indexPath.row].name
        for medR in self.horses[indexPath.row].medicalReports {
            selectedDescription = medR.description
            
        }
        //selectedLabel = self.horses[indexPath.row].medicalReports[0].description
       // selectedImage = self.[indexPath.row].image  image should be added to horse classs
        self.performSegue(withIdentifier: "oneHorse", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if segue.identifier == "oneHorse" {
             let destinationViewController = segue.destination as!   OneHorseViewController
            destinationViewController.name = selectedName!
            print(selectedDescription!)
            
            if selectedDescription != nil {
                print("Contains a value!")
                // destinationViewController.labelDescription.text = selectedDescription
            } else {
                print("Doesn’t contain a value.")
            }
           // destinationViewController.medicalReports[0].description = selectedDescription!
            print()
            for medR in destinationViewController.medicalReports {
                medR.description = selectedDescription!
                print(medR.description)
            }
            //destinationViewController.medicalReports[].description = selectedLabel!
            
           // destinationViewController.medicalReports[0].description = selectedLabel!
        }
    }
    
    
    
//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            
//            let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 100))
//
//            // code for adding centered title
//            headerView.backgroundColor = UIColor.gray
//    //      let headerLabel = UILabel(frame: CGRect(x: 0, y: 0, width:
//    //                tableView.bounds.size.width, height: 28))
//    //            headerLabel.textColor = UIColor.black
//    //            //headerLabel.text = titlesList[section]
//    //            headerLabel.textAlignment = .center
//    //            headerView.addSubview(headerLabel)
//
//            // code for adding button to right corner of section header
//            let notVaccinedButton: UIButton = UIButton(frame: CGRect(x:240, y:0, width:140, height:28)) //x:headerView.frame.size.width - 100
//            notVaccinedButton.setTitle("Not Vaccined", for: .normal)
//            notVaccinedButton.backgroundColor = UIColor.blue
//            notVaccinedButton.addTarget(self, action: #selector(showNotVaccined), for: .touchUpInside)
//
//            let vaccinedButton: UIButton = UIButton(frame: CGRect(x:45, y:0, width:140, height:28))
//            vaccinedButton.setTitle("Vaccined", for: .normal)
//            vaccinedButton.backgroundColor = UIColor.blue
//            vaccinedButton.addTarget(self, action: #selector(showVaccined), for: .touchUpInside)
//
//            headerView.addSubview(notVaccinedButton)
//            headerView.addSubview(vaccinedButton)
//
//            return headerView
     //   }
    
    @objc func showVaccined(sender:UIButton)
    {
        
       // filteredData = horses.filter { $0.vaccinated } // or !$0.vaccinated for the second option
        self.tableView.reloadData()
       
        print("Vaccined")
    }
    
    @objc func showNotVaccined(sender:UIButton)
    {
       // filteredData = horses.filter { !$0.vaccinated } // or !$0.vaccinated for the second option
        self.tableView.reloadData()

        print("Not Vaccined")
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
