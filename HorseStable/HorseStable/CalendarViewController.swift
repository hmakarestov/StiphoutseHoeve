//
//  CalendarViewController.swift
//  HorseStable
//
//  Created by Student on 09/01/2020.
//  Copyright © 2020 smartmobile. All rights reserved.
//

import UIKit

var calendarRows = [
    "25-01-2020",//weekend0
    "26-01-2020",//weekend1
    "27-01-2020",
    "28-01-2020",
    "29-01-2020",
    "30-01-2020",
    "31-01-2020",
]
var dateIndex = 0
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
}
