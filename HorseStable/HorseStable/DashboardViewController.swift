//
//  DashboardViewController.swift
//  HorseStable
//
//  Created by Student on 13/12/2019.
//  Copyright © 2019 smartmobile. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {

    @IBOutlet weak var btnPush: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pushButtonUpdate()
        // Do any additional setup after loading the view.
            
        
      
    }
    
    func pushButtonUpdate() {
        btnPush.layer.cornerRadius = 13
        btnPush.clipsToBounds = true    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
