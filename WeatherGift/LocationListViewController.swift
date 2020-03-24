//
//  LocationListViewController.swift
//  WeatherGift
//
//  Created by darwie fang on 24/3/20.
//  Copyright © 2020 darwie fang. All rights reserved.
//

import UIKit

class LocationListViewController: UIViewController {

    @IBOutlet weak var editBarButton: UIToolbar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addBarButton: UIBarButtonItem!
    var weatherLocations: [WeatherLocation] = []
    // empty array
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var weatherLocation = WeatherLocation(name: "Chestnut Hill, MA", latitude: 0, longitude: 0)
        weatherLocations.append(weatherLocation)
         weatherLocation = WeatherLocation(name: "Lilongwe, Malawi", latitude: 0, longitude: 0)
        weatherLocations.append(weatherLocation)
        weatherLocation = WeatherLocation(name: "Buenos Aires, Argentina", latitude: 0, longitude: 0)
        weatherLocations.append(weatherLocation)

        tableView.dataSource = self
        tableView.delegate = self
    }

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func editButtonPressed(_ sender: UIBarButtonItem) {
        if tableView.isEditing {
            tableView.setEditing(false, animated: true)
            sender.title = "Edit"
            addBarButton.isEnabled = true
        } else {
            tableView.setEditing(true, animated: true)
            sender.title = "Done"
            addBarButton.isEnabled = false
    }
    
    }
}
extension LocationListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherLocations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = weatherLocations[indexPath.row].name
        return cell
    }
    func tableView(_tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            weatherLocations.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath)
    {
        let itemToMove = weatherLocations[sourceIndexPath.row]
        weatherLocations.remove(at: sourceIndexPath.row)
        weatherLocations.insert(itemToMove, at: destinationIndexPath.row)
    }
}
