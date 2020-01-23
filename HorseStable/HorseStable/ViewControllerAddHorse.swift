//
//  ViewControllerAddHorse.swift
//  HorseStable
//
//  Created by Student on 12/12/2019.
//  Copyright © 2019 smartmobile. All rights reserved.
//

import UIKit

class ViewControllerAddHorse: UIViewController {

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
        backend.putJSONAddHorseToUser(query: "0", name: tbHorseName.text!, race: "White", lifeNum: tbLifeNum.text!, chipNumber: tbChipNum.text!, birthDate: "", gender: tbGender.text!,completion: {(err) in
            if let err = err {
                print("Failed to create",err)
                return
            }
            print("Successfully created horse")

        })
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
