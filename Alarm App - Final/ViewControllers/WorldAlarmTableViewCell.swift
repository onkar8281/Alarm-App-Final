//
//  WorldAlarmTableViewCell.swift
//  Alarm App - Final
//
//  Created by Onkar Vaidya on 10/09/25.
//

import UIKit

class WorldAlarmTableViewCell: UITableViewCell {

    @IBOutlet weak var smallLabel: UILabel!
    
    @IBOutlet weak var cityName: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.backgroundColor = .black
        contentView.backgroundColor = .black
        
        smallLabel.textColor = .white
        cityName.textColor = .white
        timeLabel.textColor = .white
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
