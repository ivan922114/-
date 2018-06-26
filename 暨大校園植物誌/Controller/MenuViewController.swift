//
//  MenuViewController.swift
//  暨大校園植物誌
//
//  Created by viplab on 2018/5/2.
//  Copyright © 2018年 viplab. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    @IBAction func goPlanDetail(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goPlanDetail", sender: sender.tag)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tag = sender as! Int
        switch tag {
        case 0:
            let destinationController = segue.destination as! PlantListController
            destinationController.tag = 0
            destinationController.PlantNames = ["玉帶鳳蝶", "紫蛇目蝶", "青帶鳳蝶"]
            destinationController.PlantLocations = ["鳳蝶科", "鳳蝶科", "鳳蝶科"]
            destinationController.PlantImage = ["玉帶鳳蝶", "紫蛇目蝶", "青帶鳳蝶"]

        case 1:
            let destinationController = segue.destination as! PlantListController
            destinationController.tag = 1
            destinationController.PlantNames = ["姬小紋青斑蝶", "黃蛺蝶", "流星蛺蝶"]
            destinationController.PlantLocations = ["蛺蝶科", "蛺蝶科", "蛺蝶科"]
            destinationController.PlantImage = ["姬小紋青斑蝶", "黃蛺蝶", "流星蛺蝶"]

        case 2:
            let destinationController = segue.destination as! PlantListController
            destinationController.tag = 2
            destinationController.PlantNames = ["斑粉蝶", "江崎黃蝶", "端紅蝶"]
            destinationController.PlantLocations = ["粉蝶科", "粉蝶科", "粉蝶科"]
            destinationController.PlantImage = ["斑粉蝶", "江崎黃蝶", "端紅蝶"]

        default:
            break
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //self.navigationController?.navigationBar.isHidden = true
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
