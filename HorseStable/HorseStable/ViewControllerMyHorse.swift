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
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(didTapAddItemButton))
    }
    
    @objc func didTapAddItemButton(_ sender: UIBarButtonItem)
    {
        navigationItem.title = nil
        self.performSegue(withIdentifier: "editHorseSegue", sender: "self")
    }
}
