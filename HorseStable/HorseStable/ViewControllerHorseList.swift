//
//  ViewControllerHorseList.swift
//  HorseStable
//
//  Created by Student on 12/12/2019.
//  Copyright © 2019 smartmobile. All rights reserved.
//

import UIKit

struct CellDataDemo{
    let horseImage : String
    let horseName : String
    let fluShot : Date
    let decontamination : Date
}


class ViewControllerHorseList: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var horses = [Horse] ()
    var backend = BackendHelper()
    var userID : String? = ""
    var selectedName: String?
    var selectedImage = UIImage(named: "horse")
    var selectedGender: Gender?
    var selectedLifeNumber: String?
    var selectedChipNumber: String?
    var selectedDecontaminationDate: String?
    var selectedFluShotDate: String?
    var token = MyVariables.token
    @IBOutlet weak var tableViewHorseList: UITableView!
    
    var horseInfo = [
        CellDataDemo(horseImage: "horseImg", horseName: "Horsy", fluShot: Date(), decontamination: Date()),
        CellDataDemo(horseImage: "horseImg", horseName: "Horsy", fluShot: Date(), decontamination: Date()),
        CellDataDemo(horseImage: "horseImg", horseName: "Horsy", fluShot: Date(), decontamination: Date()),
        CellDataDemo(horseImage: "horseImg", horseName: "Horsy", fluShot: Date(), decontamination: Date()),
        CellDataDemo(horseImage: "horseImg", horseName: "Horsy", fluShot: Date(), decontamination: Date()),
        CellDataDemo(horseImage: "horseImg", horseName: "Horsy", fluShot: Date(), decontamination: Date()),
        ]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAddItemButton))
        //put user id in query
        var horse = Horse(id: 5, name: "Joro", race: "twoRace", lifeNumber: "123", chipNumber: "123", birthDate: Date(), gender: Gender.FEMALE, medicalReports: [], owners: [])
        horses.append(horse)
        
        self.backend.verifyToken(to: self.token,completion: {
                (expDate,sub) in
                let currentDateTime = Date()
                if (expDate!>currentDateTime) {
                    print("expired")
                }
                    if (sub == nil || sub == "-1") {
                    print("Token not verified",sub as Any)
                    // redirect back to log in
                    }
                    else {
                    print("Success")
                    print(sub as Any)
                                   
                    self.backend.getJSONUser(query: sub!, completion:{ (user) in
                        // print(user)
                        print(user.lastName! as Any)
                        self.userID = sub!
                        self.backend.getJSONAssignedHorseToUser(query:sub!,completion:{ arrayHorses in
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
                                       
                                   })

                                   
                               }
                               
                           })
                           print("Successful log in")
                           //how to get the TOKEN and store it? then verify it????
                           //return result.model!
    }
    
    @objc func didTapAddItemButton(_ sender: UIBarButtonItem)
    {
        navigationItem.title = nil
        self.performSegue(withIdentifier: "addHorseSegue", sender: "self")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return horses.count
        return horseInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath) as! CustomCell

        //let horse = self.horses[indexPath.row]
        cell.horseNameLabel?.text = self.horseInfo[indexPath.row].horseName//self.horses[indexPath.row].name
        cell.decontaminationDateLabel?.text = "\(self.horseInfo[indexPath.row].decontamination)"   //"No record"
        cell.fluShotDateLabel?.text = "\(self.horseInfo[indexPath.row].fluShot)" //"No record"
        cell.horseImage?.image =  UIImage(named: "horse") //UIImage(contentsOfFile: self.horseInfo[indexPath.row].horseImage) //
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
             //pass data to next view s
        selectedName = self.horseInfo[indexPath.row].horseName
        selectedGender = Gender.MALE
        selectedLifeNumber = "\(self.horseInfo[indexPath.row].fluShot)"// self.horses[indexPath.row].lifeNumber
        selectedChipNumber =  "GRTYT"
      
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
        
        if(segue.identifier == "addHorseSegue") {
           let destinationViewController = segue.destination as! ViewControllerAddHorse
            
            //destinationViewController.userId = self.userID!
        }
       }
}


class CustomCell : UITableViewCell{
    @IBOutlet weak var horseNameLabel: UILabel!
    @IBOutlet weak var decontaminationDateLabel: UILabel!
    @IBOutlet weak var fluShotDateLabel: UILabel!
    @IBOutlet weak var horseImage: UIImageView!
        
}







