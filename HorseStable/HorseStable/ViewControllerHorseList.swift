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

        let horse = horses[indexPath.row]
        cell.horseNameLabel?.text = horse.name
        cell.decontaminationDateLabel?.text = "Date"
        cell.fluShotDateLabel?.text = "Date"
        cell.horseImage?.image = UIImage(named: "horse")

        return cell
    }
        
}

class CustomCell : UITableViewCell{
    @IBOutlet weak var horseNameLabel: UILabel!
    @IBOutlet weak var decontaminationDateLabel: UILabel!
    @IBOutlet weak var fluShotDateLabel: UILabel!
    @IBOutlet weak var horseImage: UIImageView!
        
}







