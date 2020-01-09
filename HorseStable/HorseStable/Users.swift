//
//  Users.swift
//  HorseStable
//
//  Created by Student on 12/12/2019.
//  Copyright © 2019 smartmobile. All rights reserved.
//

import UIKit

class Users: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var usersTableView: UITableView!
    
    var user : User?
    var userName : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        usersTableView.delegate = self
        usersTableView.dataSource = self
        user = .init(image: "./Assets/anonymous user icon", username: "Stella van Sanden")
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
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UserCell
        
        cell.userName?.text = user?.Username
        cell.imageView?.image = UIImage(named: "default profile image")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! UserCell
//        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard?.instantiateViewController(withIdentifier: "ProfileVC") as? InteractionUser
//        vc?.nameUser = cell.userName.text!
//        self.present(vc!, animated: true, completion: nil)
        
        //pass data to next view s
        userName = cell.userName.text
//            for medR in self.filteredData[indexPath.row].medicalReports {
//                selectedDescription = medR.description
//
//            }
        print("index row clicked")
            self.performSegue(withIdentifier: "oneUser", sender: self)
        //print("user is: " + cell.userName.text!)
       // performSegue(withIdentifier: "GoToUser", sender: indexPath)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
         if segue.identifier == "oneUser" {
             let destinationViewController = segue.destination as!   InteractionUser
            destinationViewController.nameUser = userName!
           // print(selectedDescription!)
             //pass image
             //destinationViewController.newImage = selectedImage!
            
            if userName != nil {
                print("Contains a value!")
                // destinationViewController.labelDescription.text = selectedDescription
            } else {
                print("Doesn’t contain a value.")
            }

//            for medR in destinationViewController.medicalReports {
//                medR.description = selectedDescription!
//                print(medR.description)
//            }
        }
    }
    
}
