//
//  Stopwatch-TimerCellTableViewCell.swift
//  Alarm App - Final
//
//  Created by Onkar Vaidya on 11/09/25.
//

import UIKit

class Stopwatch_TimerCellTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var startStopButton: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var lapResetButton: UIButton!
    
    
    
    
    var startStopHandler: (() -> Void)?
    var lapResetHandler: (() -> Void)?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = .black
        
        // Labels
        timerLabel.textColor = .white
        timerLabel.text = "00:00.00"
        
        // Buttons

        
        startStopButton.setTitle("Start", for: .normal)
        lapResetButton.setTitle("Lap", for: .normal)
        
        
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    @IBAction func startStopButton(_ sender: UIButton) {
        startStopHandler?()
        
    }
    
    
    @IBAction func lapResetButton(_ sender: UIButton) {
        lapResetHandler?()
        
    }
    
}
