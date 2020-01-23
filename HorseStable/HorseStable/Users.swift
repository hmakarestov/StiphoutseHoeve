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
    
    var userID: String = ""
    var user : User?
    var userName : String?
    var userImage : UIImage?
    var users = [User] ()
    var backEnd = BackendHelper ()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
     backEnd.getJSONUsers(completion:{ arrayUsers in
        print("Users before assign: \(self.users.count)")
        self.users = arrayUsers
        self.usersTableView.reloadData()
        print("ArrayUsers: \(arrayUsers.count)")
        print("Users After Assign: \(self.users.count)")
        for u in self.users {
            print(u.firstName as Any)
        }
     })
        print("Users Outside Assign: \(self.users.count)")
        usersTableView.delegate = self
        usersTableView.dataSource = self
      

    }
  override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        usersTableView.reloadData()
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
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UserCell
       // cell.textLabel!.text = self.users[indexPath.row].firstName
        cell.userName?.text =  ("\(self.users[indexPath.row].firstName!) " + " " +  "\(self.users[indexPath.row].lastName!)")
       cell.imageView?.image = UIImage(named: "default profile image")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! UserCell
        
        //pass data to next view s
        userName = cell.userName.text
        userImage = cell.imageView?.image
        userID = String(self.users[indexPath.row].id!)
        self.performSegue(withIdentifier: "oneUser", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            
         if segue.identifier == "oneUser" {
             let destinationViewController = segue.destination as!   InteractionUser
            destinationViewController.nameUser = userName!
            destinationViewController.imageUser = userImage!
            destinationViewController.userID = userID
            destinationViewController.instanceOfVCA = self
            if userName != nil  || userImage != nil{
                print("Contains a value!")
                // destinationViewController.labelDescription.text = selectedDescription
            } else {
                print("Doesn’t contain a value.")
            }

        }
    }
    
}
