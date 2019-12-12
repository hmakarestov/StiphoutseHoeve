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
    
    var notification : Notification?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        notificationsTableView.delegate = self
        notificationsTableView.dataSource = self
        notification = .init(name: "New contest coming up!", description: "Sign up for this new contest and win cool prizes")
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
}
