//
//  NotificationCell.swift
//  HorseStable
//
//  Created by Student on 12/12/2019.
//  Copyright © 2019 smartmobile. All rights reserved.
//

import UIKit

class NotificationCell: UITableViewCell {

    @IBOutlet weak var imageNotification: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelNotification: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var buttonSeeMore: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let screenSize = UIScreen.main.bounds
        let separatorHeight = CGFloat(23)
        let additionalSeparator = UIView.init(frame: CGRect(x: 0, y: self.frame.size.height-separatorHeight, width: screenSize.width, height: separatorHeight))
        additionalSeparator.backgroundColor = #colorLiteral(red: 0.6164805293, green: 0.7786822319, blue: 0.9191916585, alpha: 1)
        self.addSubview(additionalSeparator)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func showFullNotification(_ sender: Any) {
        
    }
    
    
    
    
}
