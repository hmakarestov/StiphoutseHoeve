//
//  NotificationSpecificUser.swift
//  HorseStable
//
//  Created by Student on 12/12/2019.
//  Copyright © 2019 smartmobile. All rights reserved.
//

import UIKit

class NotificationSpecificUser: UIViewController, UITextViewDelegate {

    @IBOutlet weak var buttonSendNotification: UIButton!
    @IBOutlet weak var textviewNotification: UITextView!
    
    var nameUser : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        buttonSendNotification.layer.cornerRadius = 20
        textviewNotification.layer.cornerRadius = 10
        textviewNotification.delegate = self
        textviewNotification.text = "Send notification to \(nameUser)"
        textviewNotification.textColor = UIColor.lightGray
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textviewNotification.textColor == UIColor.lightGray {
            textviewNotification.text = nil
            textviewNotification.textColor = UIColor.black
        }
    }
    
}
