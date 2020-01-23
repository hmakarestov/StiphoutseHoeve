//
//  ViewController.swift
//  SlideInTransition
//
//  Created by Gary Tokman on 1/12/19.
//  Copyright © 2019 Gary Tokman. All rights reserved.
//

import UIKit

struct CellDataReservation{
    let date : String
    let location : String
}

struct CellDataNotification{
    let title : String
    let description : String
    let date : String
}

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableReservations: UITableView!
    @IBOutlet weak var tableNotifications: UITableView!
    
    var selectedCellIndexPath: IndexPath?
    let selectedCellHeight: CGFloat = 150.0
    let unselectedCellHeight: CGFloat = 88.0
    
    var notifications = [Post] ()
    var backend = BackendHelper()
    
    let transiton = SlideInTransition()
    var topView: UIView?

    override func viewDidLoad() {
        super.viewDidLoad()
        backend.getJSONPosts(completion:{ arrayPosts in
              print("Horses before assign: \(self.notifications.count)")
        for p in arrayPosts{
            if (p.type==PostType.ADMIN_NOTICE) {
                self.notifications.append(p)
            }
        }
              //self.notifications = arrayPosts
              self.tableNotifications.reloadData()
              print("arrayPosts: \(arrayPosts.count)")
              print("Notifications After Assign: \(self.notifications.count)")
              for h in self.notifications {
                print(h.description as Any)
              
              }
           })
              print("Posts Outside Assign: \(self.notifications.count)")
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func didTapMenu(_ sender: UIBarButtonItem) {
        guard let menuViewController = storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as? MenuViewController else { return }
        menuViewController.didTapMenuType = { menuType in
            self.transitionToNew(menuType)
        }
        menuViewController.modalPresentationStyle = .overCurrentContext
        menuViewController.transitioningDelegate = self
        present(menuViewController, animated: true)
    }

    func transitionToNew(_ menuType: MenuType) {
//        let title = String(describing: menuType).capitalized
//        self.title = title

//        topView?.removeFromSuperview()
        switch menuType {
        case .dashboard:
            let view = UIView()
            view.frame = self.view.bounds
            self.view.addSubview(view)
            self.topView = view
        case .myHorses:
            performSegue(withIdentifier: "myHorsesSegue", sender: nil)
        case .profile:
            performSegue(withIdentifier: "profileMenuSegue", sender: nil)
       case .logout:
        let alertController = UIAlertController(title: "Log out", message:
               "Are you sure you want to log out?", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Yes", style: .default,  handler: { action in
            self.performSegue(withIdentifier: "LogoutUser", sender: nil)
        }))
        
         alertController.addAction(UIAlertAction(title: "No", style: .default))

        self.present(alertController, animated: true, completion: nil)
        default:
            break
        }
    }
    
    var reservations = [
        CellDataReservation(date: "Tuesday 12.09.2050", location: "Indoor Track"),
        CellDataReservation(date: "Tuesday 12.09.2050", location: "Outdoor Track"),
        ]
    
//    var notifications = [
//        CellDataNotification(title: "Dont forget to feed your horses, folks", description: "So they wont die", date: "17.08.2019"),
//        ]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(tableView == tableReservations){
            return reservations.count
        }
        else{
            return notifications.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(tableView == tableReservations){
            let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCellReservations", for: indexPath) as! CustomCellReservations

            let post = reservations[indexPath.row]
            cell.dateLabelReservation?.text = post.date
            cell.locationLabelReservation?.text = post.location

            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCellNotifications", for: indexPath) as! CustomCellNotifications

            let notif = notifications[indexPath.row]
            cell.titleLabelNotification?.text = notif.type.map { $0.rawValue }
            cell.descriptionLabelNotification?.text = notif.description
            let formatter = DateFormatter()
            formatter.dateFormat = "dd-MM-yyy"
            let date = formatter.string(from: notif.dateTime!)
            cell.dateLabelNotification?.text = date

            return cell
        }
    }
    
    //to expand notification
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if selectedCellIndexPath == indexPath {
            return selectedCellHeight
        }
            return unselectedCellHeight
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! CustomCellNotifications
        
        if selectedCellIndexPath != nil && selectedCellIndexPath == indexPath {
            selectedCellIndexPath = nil
        }
        else{
            selectedCellIndexPath = indexPath
            // to make sure the other notifications only show 1 line when another notification is expanded
            for row in 0..<tableView.numberOfRows(inSection: 0)
            {
                let cell = tableView.cellForRow(at: IndexPath(row: row, section: 0)) as! CustomCellNotifications
                cell.descriptionLabelNotification.numberOfLines = 1
            }
        }

        tableView.beginUpdates()
        tableView.endUpdates()

        if selectedCellIndexPath == indexPath {
            // This ensures, that the cell is fully visible once expanded
            tableView.scrollToRow(at: indexPath, at: .none, animated: true)
            cell.descriptionLabelNotification.numberOfLines = 0
        }
        else{
            cell.descriptionLabelNotification.numberOfLines = 1
        }
    }

}

class CustomCellNotifications : UITableViewCell{
//    @IBOutlet weak var dateLabelReservation: UILabel!
//    @IBOutlet weak var locationLabelReservation: UILabel!
    
    @IBOutlet weak var titleLabelNotification: UILabel!
    @IBOutlet weak var descriptionLabelNotification: UILabel!
    @IBOutlet weak var dateLabelNotification: UILabel!
    
}

class CustomCellReservations : UITableViewCell{
//    @IBOutlet weak var titleNotification: UILabel!
//    @IBOutlet weak var descriptionNotification: UILabel!
//    @IBOutlet weak var dateNotifications: UILabel!
    @IBOutlet weak var dateLabelReservation: UILabel!
    @IBOutlet weak var locationLabelReservation: UILabel!
    
}








extension HomeViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transiton.isPresenting = true
        return transiton
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transiton.isPresenting = false
        return transiton
    }
}




