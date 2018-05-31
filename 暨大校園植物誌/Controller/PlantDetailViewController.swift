//
//  PlantDetailViewController.swift
//  暨大校園植物誌
//
//  Created by viplab on 2018/5/31.
//  Copyright © 2018年 viplab. All rights reserved.
//

import UIKit

class PlantDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var plant : Plant = Plant()
    
    @IBOutlet var headerView: PlantDetailHeaderView!
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: EnglishnameTextCell.self), for: indexPath) as! EnglishnameTextCell
            cell.EnglishnameLabel.text = plant.Englishname
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SectionnameTextCell.self), for: indexPath) as! SectionnameTextCell
            cell.SectionnameLabel.text = plant.Sectionname
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: AliasTextCell.self), for: indexPath) as! AliasTextCell
            cell.AliasLabel.text = plant.Alias
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: OriginTextCell.self), for: indexPath) as! OriginTextCell
            cell.OriginLabel.text = plant.Origin
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: distributedTextCell.self), for: indexPath) as! distributedTextCell
            cell.distributedLabel.text = plant.distributed
            return cell
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: applicationTextCell.self), for: indexPath) as! applicationTextCell
            cell.applicationLabel.text = plant.application
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

        headerView.headerImageView.image = UIImage(named: plant.image)
        headerView.NameLabel.text = plant.Name
        headerView.ScientificnameLabel.text = plant.Scientificname
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
