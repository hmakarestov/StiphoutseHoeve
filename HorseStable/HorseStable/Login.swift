//
//  Login.swift
//  HorseStable
//
//  Created by Student on 06/12/2019.
//  Copyright © 2019 smartmobile. All rights reserved.
//

import UIKit

class Login: UIViewController {

    
    @IBOutlet weak var labelRegister: UILabel!
    
    @IBOutlet weak var buttonLogin: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let tap = UITapGestureRecognizer(target: self, action: #selector(Login.goToRegister))
        labelRegister.isUserInteractionEnabled = true
        labelRegister.addGestureRecognizer(tap)
        buttonLogin.layer.cornerRadius = 20
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
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let registerViewController = storyBoard.instantiateViewController(withIdentifier: "Register")
        registerViewController.modalPresentationStyle = .fullScreen
        self.present(registerViewController, animated: true, completion: nil)
    }
}

