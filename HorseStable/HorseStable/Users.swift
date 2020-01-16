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
    var userImage : UIImage?
    var users = [User] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        usersTableView.delegate = self
        usersTableView.dataSource = self
        
        let dob = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyy"
        let date = formatter.string(for: 20-09-1997)
        
        let numbers = 0...0
        
            for _ in numbers{
                
                let user = User(id: 1, username: "Stella van Sanden", firstName: "Stella", middleName: "", lastName: "van Sanden", email: "stellavs@gmail.com", password: "***", role: Role.USER, gender: Gender.FEMALE, birthdate: dob, image: "test")
                let user2 = User(id: 2, username: "Holland Kaaskop", firstName: "Holland", middleName: "", lastName: "Kaaskop", email: "hollandk@gmail.com", password: "***", role: Role.USER, gender: Gender.FEMALE, birthdate: dob, image: "test")
                let user3 = User(id: 3, username: "Bulgaar Buitenlander", firstName: "Bulgaar", middleName: "", lastName: "Buitenlander", email: "bulgaarb@gmail.com", password: "***", role: Role.USER, gender: Gender.MALE, birthdate: dob, image: "test")
                
                users.append(user);
                users.append(user2);
                users.append(user3);

                usersTableView.reloadData()
                
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
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UserCell
        
        cell.userName?.text =  users[indexPath.row].username
        cell.imageView?.image = UIImage(named: "default profile image")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! UserCell
        
        //pass data to next view s
        userName = cell.userName.text
        userImage = cell.imageView?.image
        self.performSegue(withIdentifier: "oneUser", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
         if segue.identifier == "oneUser" {
             let destinationViewController = segue.destination as!   InteractionUser
            destinationViewController.nameUser = userName!
            destinationViewController.imageUser = userImage!
            
            if userName != nil  || userImage != nil{
                print("Contains a value!")
                // destinationViewController.labelDescription.text = selectedDescription
            } else {
                print("Doesn’t contain a value.")
            }

        }
    }
    
}
