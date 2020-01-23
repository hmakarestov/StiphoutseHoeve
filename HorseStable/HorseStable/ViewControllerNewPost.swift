//
//  ViewControllerNewPost.swift
//  HorseStable
//
//  Created by Student on 09/01/2020.
//  Copyright © 2020 smartmobile. All rights reserved.
//

import UIKit

class ViewControllerNewPost: UIViewController {
    @IBOutlet weak var lbDescription: UITextView!
    let url = URL(string: "http://localhost:8083/horse/1")!
    let image = UIImage(named: "horse")
    var backEnd = BackendHelper ()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func publishPost(_ sender: Any) {
        var description : String
        description = lbDescription.text
        backEnd.postJSONPost(type: "POST",description: description,image: "horse", completion: {status in print("post posted")})
        dismiss(animated: true, completion: nil)
        
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
