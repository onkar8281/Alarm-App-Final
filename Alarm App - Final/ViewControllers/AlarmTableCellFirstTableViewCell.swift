//
//  AlarmTableCellFirstTableViewCell.swift
//  Alarm App - Final
//
//  Created by Onkar Vaidya on 10/09/25.
//

import UIKit

class AlarmTableCellFirstTableViewCell: UITableViewCell {

    @IBOutlet weak var labelName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func onTapOfSetUpBtn(_ sender: UIButton) {
    }
}
