//
//  CalendarViewController.swift
//  HorseStable
//
//  Created by Student on 09/01/2020.
//  Copyright © 2020 smartmobile. All rights reserved.
//

import UIKit

var calendarRows = [
    "Saturday  25-01-2020",//weekend0
    "Sunday  26-01-2020",//weekend1
    "Monday  27-01-2020",
    "Tuesday  28-01-2020",
    "Wednesday  29-01-2020",
    "Thursday  30-01-2020",
    "Friday  31-01-2020",
]
var dateIndex = 0
var launchPad = true;
class CalendarViewController: UITableViewController {
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return calendarRows.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = calendarRows[indexPath.row]
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dateIndex = indexPath.row
        performSegue(withIdentifier: "dateSegue", sender: self)
    }
    @IBAction func SwitchViewAction(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex
        {
        case 0:
            launchPad = true
        case 1:
            launchPad = false
        default:
            break
        }
    }
}
