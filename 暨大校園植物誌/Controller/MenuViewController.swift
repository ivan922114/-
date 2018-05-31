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
            destinationController.PlantNames = ["欖仁樹", "奧氏虎皮楠"]
            destinationController.PlantLocations = ["通識停車場旁", "行政大樓停車場旁草地"]
            destinationController.PlantImage = ["欖仁樹縮圖", "奧氏虎皮楠縮圖"]

        case 1:
            let destinationController = segue.destination as! PlantListController
            destinationController.tag = 1
            destinationController.PlantNames = ["變葉木"]
            destinationController.PlantLocations = ["學人會館前"]
            destinationController.PlantImage = ["變葉木縮圖"]

        case 2:
            let destinationController = segue.destination as! PlantListController
            destinationController.tag = 2
            destinationController.PlantNames = ["九芎"]
            destinationController.PlantLocations = ["機車道"]
            destinationController.PlantImage = ["九芎縮圖"]
        
        case 3:
            let destinationController = segue.destination as! PlantListController
            destinationController.tag = 3
            destinationController.PlantNames = ["台灣海桐"]
            destinationController.PlantLocations = ["科一館停車場前"]
            destinationController.PlantImage = ["台灣海桐縮圖"]

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
