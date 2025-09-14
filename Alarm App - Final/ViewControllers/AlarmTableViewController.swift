//
//  AlarmTableViewController.swift
//  Alarm App - Final
//
//  Created by Onkar Vaidya on 10/09/25.
//

import UIKit

class AlarmTableViewController: UITableViewController {
  
    var titleSection = ["Sleep | Wake Up", "Other"]
    
    let time = ["1.10 PM", "7.42 AM", "4.30 PM", "2.15 PM", "6.00 AM"]
    let date = ["Alarm, everyday", "Alarm, Mon, Tue, Wed", "Alarm, Sunday", "Alarm, Friday", "Alarm, evryday"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        tableView.backgroundColor = .black
        tableView.separatorColor = .gray
        
        // Enable large titles for this navigation controller
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        
        // Set title
        self.title = "Alarms"
        
        // Optional: customize colors
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        
        
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return titleSection.count
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Make tab bar black when this VC appears
        tabBarController?.tabBar.barTintColor = .black
        tabBarController?.tabBar.tintColor = .systemYellow
        tabBarController?.tabBar.unselectedItemTintColor = .lightGray
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
         if section == 0 {
            return 1
        } else {
            return 5
        }
    }
    
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return 60
        } else {
            return 40
        }
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titleSection[section]
        
    }

    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            cell.backgroundColor = .black
            cell.textLabel?.textColor = .white
  
            
            
        } else {
            // Section 1 reusable cells
            cell.backgroundColor = .black
            cell.textLabel?.textColor = .white
        }
    }

    


    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 60
        } else {
            return 100
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 1 {
     
            let cell = tableView.dequeueReusableCell(withIdentifier: "alarmCell", for: indexPath) as! AlarmTableViewCell
            cell.timeLabel.text = time[indexPath.row]
            cell.dateLabel.text = date[indexPath.row]
            
            return cell
            
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! AlarmTableCellFirstTableViewCell
            cell.textLabel?.text = "No Alarm"
            return cell
            
        }
        
    
        
        
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let header = view as? UITableViewHeaderFooterView {
            header.textLabel?.textColor = .white
            header.textLabel?.font = UIFont.boldSystemFont(ofSize: 16)
            header.contentView.backgroundColor = .black
        }
    }
}
