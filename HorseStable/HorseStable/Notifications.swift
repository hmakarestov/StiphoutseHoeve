//
//  Notifications.swift
//  HorseStable
//
//  Created by Student on 12/12/2019.
//  Copyright © 2019 smartmobile. All rights reserved.
//

import UIKit

class Notifications: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var notificationsTableView: UITableView!
    var selectedCellIndexPath: IndexPath?
    let selectedCellHeight: CGFloat = 200.0
    let unselectedCellHeight: CGFloat = 88.0
    
    var notification : Notification?
    var notifications = [Notification] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        notificationsTableView.delegate = self
        notificationsTableView.dataSource = self
        
        let today = Date()
        
        //test user for notification constructor
        let user = User(id: 1,  firstName: "Stella", middleName: "", lastName: "van Sanden", email: "stellavs@gmail.com", role: Role.USER, gender: Gender.FEMALE, birthdate: today)
        //test facility for notification constructor
        let facility = Facility(id: 1, name: "Stable", reservable: false, reservations: [], unavailableTimeSlots: [])
        
        
        let numbers = 0...0
        
            for _ in numbers{
                
                let notification = Notification(id: 1, title: "New contest coming up!", description: "Sign up for this new contest and win cool prizes! Please sign up on the whiteboard at the stable to enter the contest.", date: today, facility: facility, user: user)
                let notification2 = Notification(id: 2, title: "Vet is coming to Stiphoutse Hoeve", description: "Next week on the 5th of December we have scheduled a vetenerian from the Eindhoven vet hospital to come here at 5:00 p.m.", date: today, facility: facility, user: user)
                let notification3 = Notification(id: 3, title: "Stiphoutse Hoeve closed!", description: "Stiphoutse Hoeve will be closed on the 25th and 26th of December because of Christmas. Please keep that in mind when you want to schedule a lesson.", date: today, facility: facility, user: user)
                
                notifications.append(notification);
                notifications.append(notification2);
                notifications.append(notification3);

                notificationsTableView.reloadData()
                
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return notifications.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationCell", for: indexPath) as! NotificationCell
        
        cell.labelTitle?.text = notifications[indexPath.row].title
        cell.labelNotification?.text = notifications[indexPath.row].description
            let today = notifications[indexPath.row].date
            let formatter = DateFormatter()
            formatter.dateFormat = "dd-MM-yyy"
            let date = formatter.string(from: today as Date)
        cell.labelDate.text = date
        cell.imageView?.image = UIImage(named: "notification icon")

        return cell
    }
    
    //this code is used to expand the notification
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if selectedCellIndexPath == indexPath {
            return selectedCellHeight
        }
            return unselectedCellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! NotificationCell
        
        if selectedCellIndexPath != nil && selectedCellIndexPath == indexPath {
            selectedCellIndexPath = nil
        }
        else{
            selectedCellIndexPath = indexPath
            // to make sure the other notifications only show 1 line when another notification is expanded
            for row in 0..<tableView.numberOfRows(inSection: 0)
            {
                let cell = tableView.cellForRow(at: IndexPath(row: row, section: 0)) as! NotificationCell
                cell.labelNotification.numberOfLines = 1
            }
        }

        tableView.beginUpdates()
        tableView.endUpdates()

        if selectedCellIndexPath == indexPath {
            // This ensures, that the cell is fully visible once expanded
            tableView.scrollToRow(at: indexPath, at: .none, animated: true)
            cell.labelNotification.numberOfLines = 0
        }
        else{
            cell.labelNotification.numberOfLines = 1
        }
    }
    
}
