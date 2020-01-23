//
//  ViewControllerEditHorse.swift
//  HorseStable
//
//  Created by Student on 12/12/2019.
//  Copyright © 2019 smartmobile. All rights reserved.
//

import UIKit

class ViewControllerEditHorse: UIViewController {

    @IBOutlet weak var imgHorse: UIImageView!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var genderField: UITextField!
    @IBOutlet weak var lifenumberField: UITextField!
    @IBOutlet weak var chipnumberField: UITextField!
    @IBOutlet weak var saveEditButton: UIBarButtonItem!
    
    var image: UIImage!
    var name: String = ""
    var gender: Gender = Gender.UNSPECIFIED
    var lifenumber: String = ""
    var chipnumber: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgHorse.image = image
        nameField.text = name
        genderField.text = "\(gender)"
        lifenumberField.text = lifenumber
        chipnumberField.text = chipnumber
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(didTapAddItemButton))
    }
    
    @objc func didTapAddItemButton(_ sender: UIBarButtonItem)
       {
           //SAVE CHANGES HERE
       }
}
