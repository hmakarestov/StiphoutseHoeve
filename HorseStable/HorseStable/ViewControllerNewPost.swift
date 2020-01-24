//
//  ViewControllerNewPost.swift
//  HorseStable
//
//  Created by Student on 09/01/2020.
//  Copyright © 2020 smartmobile. All rights reserved.
//

import UIKit

class ViewControllerNewPost: UIViewController, UITextViewDelegate {
    @IBOutlet weak var lbDescription: UITextView!
    let url = URL(string: "http://localhost:8083/horse/1")!
    let image = UIImage(named: "horse")
    var backEnd = BackendHelper ()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lbDescription.text = "Leave a notification for all users."
        lbDescription.textColor = UIColor.lightGray
        lbDescription.delegate = self
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(tap)
        
    }
    

    @IBAction func publishPost(_ sender: Any) {
        var description : String
        description = lbDescription.text
        backEnd.postJSONPost(type: "POST",description: description,image: "horse", completion: {status in print("post posted")})
        
       // dismiss(animated: true, completion: nil)
         self.navigationController?.popViewController(animated: true)
        
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if lbDescription.textColor == UIColor.lightGray {
            lbDescription.text = nil
            lbDescription.textColor = UIColor.black
        }
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
