//
//  Login.swift
//  HorseStable
//
//  Created by Student on 06/12/2019.
//  Copyright © 2019 smartmobile. All rights reserved.
//

import UIKit

class Login: UIViewController {
    var backend = BackendHelper ()
    var username : String = ""
    var password : String = ""
    
    @IBOutlet weak var labelRegister: UILabel!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var buttonLogin: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let tap = UITapGestureRecognizer(target: self, action: #selector(Login.goToRegister))
        labelRegister.isUserInteractionEnabled = true
        labelRegister.addGestureRecognizer(tap)
        buttonLogin.layer.cornerRadius = 20
    }
    
    @IBAction func logIn(_ sender: Any) {
        username = usernameField.text!
        if (usernameField.text=="admin") {
            performSegue(withIdentifier: "adminSegue", sender: self)
        }
        else {
            performSegue(withIdentifier: "userSegue", sender: self)
            
        }
        //!!!!!!!!!!!!!
        //make this work, this is the log in
//        backend.authenticate(username: usernameField.text!, passowrd: passwordField.text!) { (result) in
//            print("Successful log in")
//            //how to get the TOKEN and store it? then verify it????
//            
//        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func goToRegister(sender: UITapGestureRecognizer) {
        //let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
      //  let registerViewController = storyBoard.instantiateViewController(withIdentifier: "Register")
      //  registerViewController.modalPresentationStyle = .fullScreen
      //  self.present(registerViewController, animated: true, completion: nil)
        
        username = usernameField.text!
        if (usernameField.text=="admin") {
          let vc = DashboardViewController() //your view controller
           self.present(vc, animated: true, completion: nil)
        }
        else {
            
            
            let vc = HomeViewController() //your view controller
            self.present(vc, animated: true, completion: nil)
        }
    }
}

