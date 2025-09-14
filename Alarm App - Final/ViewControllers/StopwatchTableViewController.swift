//
//  StopwatchTableViewController.swift
//  Alarm App - Final
//
//  Created by Onkar Vaidya on 10/09/25.
//

import UIKit

class StopwatchTableViewController: UITableViewController {
    
    var timerRunning = false
    var timer: Timer?
    var elapsedTime: TimeInterval = 0
    var laps: [String] = []
    var isRunning = false

    

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.backgroundColor = .black
        tableView.separatorColor = .gray
        

        
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1 + laps.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "timerCell", for: indexPath) as! Stopwatch_TimerCellTableViewCell
      
            
            cell.timerLabel.textColor = .white
            cell.backgroundColor = .black
            
            if isRunning {
                cell.startStopButton.setTitle("Stop", for: .normal)
                cell.lapResetButton.setTitle("Lap", for: .normal)
                cell.lapResetButton.isEnabled = true
            } else {
                cell.startStopButton.setTitle("Start", for: .normal)
                cell.lapResetButton.setTitle(laps.isEmpty ? "Lap" : "Reset", for: .normal)
                cell.lapResetButton.isEnabled = !laps.isEmpty
            }
            
            // Handlers
            cell.startStopHandler = { [weak self] in
                self?.startStopTapped()
            }
            cell.lapResetHandler = { [weak self] in
                self?.lapResetTapped()
            }
            
            
            return cell
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "lapCell", for: indexPath)
            cell.backgroundColor = .black
            cell.textLabel?.textColor = .white
            let lapNumber = laps.count - (indexPath.row - 1) // Lap N at top
            cell.textLabel?.text = "Lap \(lapNumber): \(laps[indexPath.row - 1])"


           
            
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView,
                                heightForRowAt indexPath: IndexPath) -> CGFloat {
            return indexPath.row == 0 ? 330 : 44
        }
        
        // MARK: - Stopwatch Logic
        func startStopTapped() {
            if isRunning {
                stopTimer()
            } else {
                startTimer()
            }
        }
        
        func lapResetTapped() {
            if isRunning {
                addLap()
            } else {
                resetTimer()
            }
        }
        
        func startTimer() {
            timer?.invalidate()
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self,
                                         selector: #selector(updateTimer),
                                         userInfo: nil, repeats: true)
            isRunning = true
            tableView.reloadRows(at: [IndexPath(row: 0, section: 0)], with: .none)
        }
        
        func stopTimer() {
            timer?.invalidate()
            isRunning = false
            tableView.reloadRows(at: [IndexPath(row: 0, section: 0)], with: .none)
        }
        
        func resetTimer() {
            timer?.invalidate()
            elapsedTime = 0
            laps.removeAll()
            isRunning = false
            tableView.reloadData()
        }
        
        func addLap() {
            laps.append(formattedTime(elapsedTime))
            tableView.reloadData()
        }
        
        @objc func updateTimer() {
            elapsedTime += 0.01
            if let timerCell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? Stopwatch_TimerCellTableViewCell {
                timerCell.timerLabel.text = formattedTime(elapsedTime)
            }
        }
        
        func formattedTime(_ elapsedTime: TimeInterval) -> String {
            let minutes = Int(elapsedTime) / 60
            let seconds = Int(elapsedTime) % 60
            let fraction = Int((elapsedTime - floor(elapsedTime)) * 100)
            return String(format: "%02d:%02d.%02d", minutes, seconds, fraction)
        }
    }
