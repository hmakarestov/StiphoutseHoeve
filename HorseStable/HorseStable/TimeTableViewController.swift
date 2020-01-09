//
//  TimeTableViewController.swift
//  HorseStable
//
//  Created by Student on 09/01/2020.
//  Copyright © 2020 smartmobile. All rights reserved.
//

import UIKit

var timeRows = [
    "07:00 - 07:30",
    "07:30 - 08:00",
    
    "08:00 - 08:30",
    "08:30 - 09:00",
    
    "09:00 - 09:30",
    "09:30 - 10:00",
    
    "10:00 - 10:30",
    "10:30 - 11:00",
    
    "11:00 - 11:30",
    "11:30 - 12:00",
    
    "12:00 - 12:30",
    "12:30 - 13:00",
    
    "13:00 - 13:30",
    "13:30 - 14:00",
    
    "14:00 - 14:30",
    "14:30 - 15:00",
    
    "15:00 - 15:30",
    "15:30 - 16:00",
    
    "16:00 - 16:30",
    "16:30 - 17:00",
    
    "17:00 - 17:30",//20
    "17:30 - 18:00",//21
    
    "18:00 - 18:30",//22
    "18:30 - 19:00",//23
    
    "19:00 - 19:30",//24
    "19:30 - 20:00",//25
    
    "20:00 - 20:30",
    "20:30 - 21:00",
    
    "21:00 - 21:30",
    "21:30 - 22:00",
    
]
var timeIndex = 0
class TimeTableViewController: UITableViewController {

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timeRows.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = timeRows[indexPath.row]
            if cell.textLabel?.text == "17:00 - 17:30" || cell.textLabel?.text == "17:30 - 18:00"
                || cell.textLabel?.text == "18:00 - 18:30" || cell.textLabel?.text == "18:30 - 19:00"
                || cell.textLabel?.text == "19:00 - 19:30" || cell.textLabel?.text == "19:30 - 20:00"
            {
                let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: timeRows[indexPath.row])
                attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
                cell.textLabel?.attributedText = attributeString;
            }
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        timeIndex = indexPath.row
        performSegue(withIdentifier: "timeSegue", sender: self)
    }
}
