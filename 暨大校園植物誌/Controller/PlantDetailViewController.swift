//
//  PlantDetailViewController.swift
//  暨大校園植物誌
//
//  Created by viplab on 2018/5/31.
//  Copyright © 2018年 viplab. All rights reserved.
//

import UIKit

class PlantDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, URLSessionDataDelegate{
    
    @IBOutlet var tableview: UITableView!
    
    var locations = Location()
    
    func getData(btfName: String){
        var urlComponents: URLComponents = URLComponents(string: "https://opendata.epa.gov.tw")!
        urlComponents.path = "/ws/Data/Butterfly/"
        urlComponents.queryItems = [URLQueryItem(name: "$format", value: "json"), URLQueryItem(name:"$filter", value:"CommonName eq '\(btfName)'")]
        let searchURL = urlComponents.url!
//        print(searchURL)
        
        let config = URLSessionConfiguration.default
        let session: URLSession = URLSession(configuration: config, delegate: self, delegateQueue: nil)
        session.dataTask(with: searchURL, completionHandler: { (data, urlResponse, error) in
            if let data = data,
                let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [AnyObject] {
                for result in json! {
                    if let Lat = result["WGS84Lat"] {
                        self.locations.lat = Lat! as! String
//                        print(self.locations.lat)
                    }
                    if let Lon = result["WGS84Lon"] {
                        self.locations.lon = Lon! as! String
//                        print(self.locations.lon)
                    }
                }
            }
        }).resume()
    }
    
    
    var plant: Plant = Plant()
    
    @IBOutlet var headerView: PlantDetailHeaderView!
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SectionnameTextCell.self), for: indexPath) as! SectionnameTextCell
            cell.SectionnameLabel.text = plant.Sectionname
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: distributedTextCell.self), for: indexPath) as! distributedTextCell
            cell.distributedLabel.text = plant.distributed
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: habitsTextCell.self), for: indexPath) as! habitsTextCell
            cell.habitsLabel.text = plant.habits
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SeparatorCell.self), for: indexPath) as! SeparatorCell
            cell.titleLabel.text = "蝴蝶在哪兒?"
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: mapViewCell.self), for: indexPath) as! mapViewCell
            cell.configure(location: locations)
//            print(locations)
            
            return cell
        default:
            fatalError("Failed to instantiate the table view cell.")
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isHidden = false
        getData(btfName: plant.Name)
        
        headerView.headerImageView.image = UIImage(named: plant.image)
        headerView.NameLabel.text = plant.Name
        headerView.ScientificnameLabel.text = plant.Scientificname
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMap" {
            let destinationController = segue.destination as! mapViewController
                destinationController.pName = plant.Name
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
