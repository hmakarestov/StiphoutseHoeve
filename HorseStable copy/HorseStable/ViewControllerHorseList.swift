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

class ViewControllerHorseList: UITableViewController {
    
    var horseInfo = [
        CellDataDemo(horseImage: "horseImg", horseName: "Horsy", fluShot: Date(), decontamination: Date()),
        CellDataDemo(horseImage: "horseImg", horseName: "Horsy", fluShot: Date(), decontamination: Date()),
        ]

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return horseInfo.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath) as! CustomCell

        let horse = horseInfo[indexPath.row]
        cell.horseNameLabel?.text = horse.horseName
        cell.decontaminationDateLabel?.text = "Date"
        cell.fluShotDateLabel?.text = "Date"
        cell.horseImage?.image = UIImage(named: horse.horseImage)

        return cell
    }
    
}

class CustomCell : UITableViewCell{
    @IBOutlet weak var horseNameLabel: UILabel!
    @IBOutlet weak var decontaminationDateLabel: UILabel!
    @IBOutlet weak var fluShotDateLabel: UILabel!
    @IBOutlet weak var horseImage: UIImageView!
    
}





