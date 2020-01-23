//
//  ViewControllerHorseList.swift
//  HorseStable
//
//  Created by Student on 12/12/2019.
//  Copyright © 2019 smartmobile. All rights reserved.
//

import UIKit

//struct CellDataDemo{
//    let horseImage : String
//    let horseName : String
//    let fluShot : Date
//    let decontamination : Date
//}


class ViewControllerHorseList: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var horses = [Horse] ()
    var backend = BackendHelper()
    
    var selectedName: String?
    var selectedImage = UIImage(named: "horse")
    var selectedGender: Gender?
    var selectedLifeNumber: String?
    var selectedChipNumber: String?
    var selectedDecontaminationDate: String?
    var selectedFluShotDate: String?
    
    @IBOutlet weak var tableViewHorseList: UITableView!
    
//    var horseInfo = [
//        CellDataDemo(horseImage: "horseImg", horseName: "Horsy", fluShot: Date(), decontamination: Date()),
//        CellDataDemo(horseImage: "horseImg", horseName: "Horsy", fluShot: Date(), decontamination: Date()),
//        CellDataDemo(horseImage: "horseImg", horseName: "Horsy", fluShot: Date(), decontamination: Date()),
//        CellDataDemo(horseImage: "horseImg", horseName: "Horsy", fluShot: Date(), decontamination: Date()),
//        CellDataDemo(horseImage: "horseImg", horseName: "Horsy", fluShot: Date(), decontamination: Date()),
//        CellDataDemo(horseImage: "horseImg", horseName: "Horsy", fluShot: Date(), decontamination: Date()),
//        ]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAddItemButton))
        //put user id in query
        backend.getJSONAssignedHorseToUser(query:"0",completion:{ arrayHorses in
            print("Horses before assign: \(self.horses.count)")
            self.horses = arrayHorses
            self.tableViewHorseList.reloadData()
            print("ArrayHorses: \(arrayHorses.count)")
            print("Horses After Assign: \(self.horses.count)")
            for h in self.horses {
                print(h.name as Any)
                print(h.medicalReports!.description as Any)
                }
            })
                print("Horses Outside Assign: \(self.horses.count)")
               
    }
    
    @objc func didTapAddItemButton(_ sender: UIBarButtonItem)
    {
        navigationItem.title = nil
        self.performSegue(withIdentifier: "addHorseSegue", sender: "self")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return horses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath) as! CustomCell

        //let horse = self.horses[indexPath.row]
        cell.horseNameLabel?.text = self.horses[indexPath.row].name
        cell.decontaminationDateLabel?.text = "No record"
        cell.fluShotDateLabel?.text = "No record"
        cell.horseImage?.image = UIImage(named: "horse")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
             //pass data to next view s
        selectedName = self.horses[indexPath.row].name
        selectedGender = self.horses[indexPath.row].gender
        selectedLifeNumber = self.horses[indexPath.row].lifeNumber
        selectedChipNumber = self.horses[indexPath.row].chipNumber
      
      self.performSegue(withIdentifier: "ShowHorse", sender: self)
      }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == "ShowHorse" {
                   let destinationViewController = segue.destination as!  ViewControllerMyHorse
                    destinationViewController.name = selectedName!
                    destinationViewController.gender = selectedGender!
                    destinationViewController.lifenumber = selectedLifeNumber!
                    destinationViewController.chipnumber = selectedChipNumber!
                    destinationViewController.imageHorse = selectedImage!
                  // print(selectedDescription!)
                       //pass image
                   //destinationViewController.newImage = selectedImage!
            
            if selectedFluShotDate != nil {
                print("Contains a value!")
                destinationViewController.flushot = selectedFluShotDate!
                    }
            else {
                print("Doesn’t contain a value.")
                destinationViewController.flushot = "No record"
                    }
        
            if selectedDecontaminationDate != nil {
                print("Contains a value!")
                destinationViewController.decontamination = selectedDecontaminationDate!
                    }
            else {
                print("Doesn’t contain a value.")
                destinationViewController.decontamination = "No record"
                    }
            }
       }
}


class CustomCell : UITableViewCell{
    @IBOutlet weak var horseNameLabel: UILabel!
    @IBOutlet weak var decontaminationDateLabel: UILabel!
    @IBOutlet weak var fluShotDateLabel: UILabel!
    @IBOutlet weak var horseImage: UIImageView!
        
}







