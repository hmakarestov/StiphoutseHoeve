//
//  ViewControllerMyHorse.swift
//  HorseStable
//
//  Created by Student on 12/12/2019.
//  Copyright © 2019 smartmobile. All rights reserved.
//

import UIKit

class ViewControllerMyHorse: UIViewController {

    var backend = BackendHelper()
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblGender: UILabel!
    @IBOutlet weak var lblLifeNumber: UILabel!
    @IBOutlet weak var lblChipNumber: UILabel!
    @IBOutlet weak var lblDecontamination: UILabel!
    @IBOutlet weak var lblFluShot: UILabel!
    @IBOutlet weak var imgHorse: UIImageView!
    
    var name : String = ""
    var imageHorse : UIImage!
    var gender : Gender = Gender.UNSPECIFIED
    var lifenumber : String = ""
    var chipnumber : String = ""
    var flushot : String = ""
    var decontamination : String = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        lblName.text = name
        imgHorse.image = imageHorse
        lblGender.text = "\(gender)"
        lblLifeNumber.text = lifenumber
        lblChipNumber.text = chipnumber
        lblDecontamination.text = decontamination
        lblFluShot.text = flushot
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(didTapAddItemButton))
    }
    
    @objc func didTapAddItemButton(_ sender: UIBarButtonItem)
    {
        navigationItem.title = nil
        self.performSegue(withIdentifier: "editHorseSegue", sender: "self")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editHorseSegue" {
                let destinationViewController = segue.destination as!  ViewControllerEditHorse
                 destinationViewController.image = imageHorse!
                 destinationViewController.name = name
                 destinationViewController.gender = gender
                 destinationViewController.lifenumber = lifenumber
                 destinationViewController.chipnumber = chipnumber
        }
    }
}
