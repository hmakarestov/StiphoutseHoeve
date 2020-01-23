//
//  OneHorseViewController.swift
//  HorseStable
//
//  Created by Student on 05/01/2020.
//  Copyright © 2020 smartmobile. All rights reserved.
//

import UIKit

class OneHorseViewController: UIViewController {

    @IBOutlet weak var horseAvatar: UIImageView!
    var newImage: UIImage!
    @IBOutlet weak var labelDescription: UILabel!
    var name: String = ""
    var medDescription: String = ""
    var horseDescription: String = ""
    
    @IBOutlet weak var labelHorseDescription: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = name
        // Do any additional setup after loading the view.
        labelDescription.text = medDescription
        labelHorseDescription.text = horseDescription
        horseAvatar.image = newImage
    
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
