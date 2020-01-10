//
//  ReservationViewController.swift
//  HorseStable
//
//  Created by Student on 09/01/2020.
//  Copyright © 2020 smartmobile. All rights reserved.
//

import UIKit

class ReservationViewController: UIViewController {

    @IBOutlet weak var facilityLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        dateLabel.text = calendarRows[dateIndex]
        timeLabel.text = timeRows[timeIndex]
        if launchPad
        {
            facilityLabel.text = "Launch pad"
        }
        else
        {
            facilityLabel.text = "Indoor track"
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
    @IBAction func onClickReserve(_ sender: Any) {
        let alertController = UIAlertController(title: "Reservation completed successfully.", message: "You can view your reservation details in the dashboard section. ", preferredStyle: .actionSheet)
        
        let actionOk = UIAlertAction(title: "OK",
                                     style: .default,
                                     handler: {(alert: UIAlertAction!) in self.performSegue(withIdentifier: "reserveSegue", sender: self)})//You can use a block here to handle a press on this button
        
        alertController.addAction(actionOk)
        self.present(alertController, animated: true, completion: nil)
    }
}
