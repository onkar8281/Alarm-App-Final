//
//  TimerPickerTableViewCell.swift
//  Alarm App - Final
//
//  Created by Onkar Vaidya on 11/09/25.
//

import UIKit

class TimerPickerTableViewCell: UITableViewCell {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dateViewLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        backgroundColor = .black          // cell background
        dateViewLabel.textColor = .white  // label text color
        datePicker.setValue(UIColor.white, forKeyPath: "textColor") // picker text color
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func onTapOfSubmitButton(_ sender: UIButton) {
        let totalSeconds = Int(datePicker.countDownDuration)
        let hours = totalSeconds / 3600
        let minutes = (totalSeconds % 3600) / 60
        dateViewLabel.text = "Selected Time:  \(hours)h \(minutes)m"
    }
}
