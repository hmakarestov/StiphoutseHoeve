//
//  InteractionUser.swift
//  HorseStable
//
//  Created by Student on 12/12/2019.
//  Copyright © 2019 smartmobile. All rights reserved.
//

import UIKit

class InteractionUser: UIViewController {

    @IBOutlet weak var buttonWriteNotification: UIButton!
    @IBOutlet weak var buttonDeleteUser: UIButton!
    @IBOutlet weak var imageviewUser: UIImageView!
    
    
    var nameUser : String = ""
    var imageUser : UIImage?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print("user is: " + nameUser)
        // Do any additional setup after loading the view.
        buttonWriteNotification.layer.cornerRadius = 20
        buttonDeleteUser.layer.cornerRadius = 20
       // labelUsername.text = nameUser
        
        self.title = nameUser
        self.imageviewUser.image = imageUser
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "WriteNotificationForUser"{
            let vc = segue.destination as? NotificationSpecificUser
            vc?.nameUser = nameUser
        }
    }
    
    
    @IBAction func deleteUser(_ sender: Any) {
        let alertController = UIAlertController(title: "Delete user", message:
               "Are you sure you want to delete this user?", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Cancel", style: .default))
        
         alertController.addAction(UIAlertAction(title: "Delete", style: .destructive))

        self.present(alertController, animated: true, completion: nil)
    }
}
