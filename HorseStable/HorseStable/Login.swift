//
//  Login.swift
//  HorseStable
//
//  Created by Student on 06/12/2019.
//  Copyright © 2019 smartmobile. All rights reserved.
//

import UIKit

struct MyVariables {
    static var token : String = ""//TOKEN
}
class Login: UIViewController {
    var backend = BackendHelper ()
    var username : String = ""
    var password : String = ""
     var token : String = "" //TOKEN
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
          print("TOKEN: ",self.token)
//        username = usernameField.text!
//        if (usernameField.text=="admin") {
//            performSegue(withIdentifier: "adminSegue", sender: self)
//        }
//        else {
//            performSegue(withIdentifier: "userSegue", sender: self)
//
//        }
        //!!!!!!!!!!!!!
        //make this work, this is the log in
        backend.authenticate(email: usernameField.text!, passowrd: passwordField.text!) { model,feedback, type in
            print(model as Any)
           // print(self.usernameField.text as Any)
           // print(self.passwordField.text as Any)
            if (model == nil) {
                print("Error",feedback as Any)
                print(self.token)
            }
            else {
                print(feedback as Any)
                self.token = model!
                MyVariables.token = self.token
                print("Model: ", model as Any)
                print("Successful log in")
                
                
                
//                if() {
//                    self.performSegue(withIdentifier: "adminSegue", sender: self)
//                }
//                else {
//                    self.performSegue(withIdentifier: "userSegue", sender: self)
//                }
            }
            //self.performSegue(withIdentifier: "adminSegue", sender: self)
            print("TOKEN:",self.token)
            
            //on every view this should be called so it verifies if the user is still loged in
            self.backend.verifyToken(to: self.token,completion: {
                (expDate,sub) in
                let currentDateTime = Date()
                if (expDate!>currentDateTime) {
                    print("expired")
                }
                if (sub == nil || sub == "-1") {
                    print("Token not verified",sub as Any)
                    // redirect back to log in
                }
                else {
                    print("Success")
                    print(sub as Any)
                    
                    self.backend.getJSONUser(query: sub!, completion:{ (user) in
                       // print(user)
                        print(user.lastName! as Any)
                         DispatchQueue.main.async {
                        if(user.role == Role.USER) {
                            print(user.role as Any)
                            self.performSegue(withIdentifier: "userSegue", sender: self)
                        }
                        else {
                            print(user.role as Any)
                             self.performSegue(withIdentifier: "adminSegue", sender: self)
                            }
                        }
                    })
                    
                   // print(authority as Any)
//                    if(authority == "USER") {
//
//                    }
                   
                    
                }
                
            })
            print("Successful log in")
            //how to get the TOKEN and store it? then verify it????
            //return result.model!
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

