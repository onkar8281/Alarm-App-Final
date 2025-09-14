//
//  WorldAlarmTableViewController.swift
//  Alarm App - Final
//
//  Created by Onkar Vaidya on 10/09/25.
//

import UIKit

class WorldAlarmTableViewController: UITableViewController {
    
    let tinyText: [String] = ["New York", "London", "Tokyo"]
    
    let city: [String] = ["USA", "UK", "JAPAN"]
    
    let time: [String] = ["4.44 PM", "10.30 AM", "6.39 AM"]

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
   

        
        tableView.backgroundColor = .black
        tableView.separatorColor = .darkGray
        
        // Enable large titles for this navigation controller
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        
        // Set title
        self.title = "World Alarm"
        
        // Optional: customize colors
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        tabBarController?.tabBar.tintColor = .systemYellow
        tabBarController?.tabBar.unselectedItemTintColor = .lightGray
    }



    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "worldCell", for: indexPath) as! WorldAlarmTableViewCell


        cell.smallLabel.text = tinyText[indexPath.row]
        cell.cityName.text = city[indexPath.row]
        cell.timeLabel.text = time[indexPath.row]


    

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(90)
    }
}
