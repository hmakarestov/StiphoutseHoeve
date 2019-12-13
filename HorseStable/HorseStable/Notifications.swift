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
    let selectedCellHeight: CGFloat = 150.0
    let unselectedCellHeight: CGFloat = 88.0
    
    var notification : Notification?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        notificationsTableView.delegate = self
        notificationsTableView.dataSource = self
        notification = .init(name: "New contest coming up!", description: "Sign up for this new contest and win cool prizes! Please sign up on the whiteboard at the stable to enter the contest.")
        //assign today's date as the notification date
        let today = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyy"
        notification?.theDate = formatter.string(from: today as Date)
        
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
        return 5
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationCell", for: indexPath) as! NotificationCell
        
        cell.labelTitle?.text = notification?.Title
        cell.labelNotification?.text = notification?.Description
        cell.labelDate.text = notification?.theDate
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
        }

        tableView.beginUpdates()
        tableView.endUpdates()

        if selectedCellIndexPath != nil {
            // This ensures, that the cell is fully visible once expanded
            tableView.scrollToRow(at: indexPath, at: .none, animated: true)
            cell.labelNotification.numberOfLines = 0
        }
        else{
            cell.labelNotification.numberOfLines = 1
        }
    }
}
