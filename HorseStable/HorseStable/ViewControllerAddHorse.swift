//
//  ViewControllerAddHorse.swift
//  HorseStable
//
//  Created by Student on 12/12/2019.
//  Copyright © 2019 smartmobile. All rights reserved.
//

import UIKit

class ViewControllerAddHorse: UIViewController {
    var userId : String = ""
    @IBOutlet weak var tbChipNum: UITextField!
    @IBOutlet weak var tbLifeNum: UITextField!
    @IBOutlet weak var tbGender: UITextField!
    @IBOutlet weak var tbHorseName: UITextField!
    var backend = BackendHelper()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(didTapAddItemButton))
    }
    
    @objc func didTapAddItemButton(_ sender: UIBarButtonItem)
    {
        //ADD HORSE HERE
        //userID is actually horse id
       // var  m : String
        for n in 1...10 {
          //  m = n as String
          //   userId = "\(n)"
        }
        let randomInt = Int.random(in: 1..<15)
        userId = "\(randomInt)"
        backend.postJSON(id:userId,name: tbHorseName.text!, lifeNum: tbLifeNum.text!, chipNum: tbChipNum.text!, date: Date(), gender: tbGender.text!) { (err) in
            if let err = err {
                print("Failed to create",err)
                return
            }
            
            self.backend.putJSONAddHorseToUser(query:self.userId, name: self.tbHorseName.text!, race: "White", lifeNum: self.tbLifeNum.text!, chipNumber: self.tbChipNum.text!, birthDate: "", gender: self.tbGender.text!,completion: {(err) in
                       if let err = err {
                           print("Failed to create",err)
                           return
                       }
                       print("Successfully assigned horse to user")

                   })
            print("Successfully created horse")
            
        }
       
    }
    
    //old function of adding horse
    /*
    @IBAction func addHorse(_ sender: Any) {
        backend.putJSONAddHorseToUser(query: "0", name: tbHorseName.text!, race: "White", lifeNum: tbLifeNum.text!, chipNumber: tbChipNum.text!, birthDate: "", gender: tbGender.text!,completion: {(err) in
            if let err = err {
                print("Failed to create",err)
                return
            }
            print("Successfully created horse")

        })
    }
     */
}
