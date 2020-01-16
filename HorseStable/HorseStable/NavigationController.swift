//
//  NavigationController.swift
//  HorseStable
//
//  Created by Student on 13/12/2019.
//  Copyright © 2019 smartmobile. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController,UINavigationBarDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        var viewController = NavigationController()
//        var navBar = UINavigationBar()
       // navBar.delegate = viewController
        
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = #colorLiteral(red: 0.6164805293, green: 0.7786822319, blue: 0.9191916585, alpha: 1)
            appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

            UINavigationBar.appearance().tintColor = .white
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().compactAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        } else {
            UINavigationBar.appearance().tintColor = .white
            UINavigationBar.appearance().barTintColor = #colorLiteral(red: 0.6164805293, green: 0.7786822319, blue: 0.9191916585, alpha: 1)
            UINavigationBar.appearance().isTranslucent = false
        }
        
        // Do any additional setup after loading the view.
    }
    
//    func navigationBar(_ navigationBar: UINavigationBar, didPop item: UINavigationItem) {
//        <#code#>
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
