//
//  Plant List Controller.swift
//  暨大校園植物誌
//
//  Created by viplab on 2018/5/1.
//  Copyright © 2018年 viplab. All rights reserved.
//

import UIKit

class PlantListController: UITableViewController {
    
    var PlantNames: Array<String> = []
    var PlantLocations: Array<String> = []
    var PlantImage: Array<String> = []
    var tag: Int = 0
    
    var Pap:[Plant] = [Plant(Name: "玉帶鳳蝶", Scientificname: "Papilio polytes", Sectionname: "鳳蝶科 Papilionidae", distributed: "廣泛分布在亞洲地區", habits: "玉帶鳳蝶喜愛訪花，常在陽光普照時在花園出現，尤其馬纓丹、龍船花、茉莉等植物", image: "玉帶鳳蝶"),
                       Plant(Name: "紫蛇目蝶", Scientificname: "Elymnias hypermnestra", Sectionname: "鳳蝶科 Papilionidae", distributed: "分布於本島低、中海拔地區，龜山島、澎湖等地可見，棲息於常綠闊葉林、都市綠地", habits: "一年多世代，較偏好棲息於潮濕及陰暗的場所，有吸食腐果之習慣", image: "紫蛇目蝶"),
                       Plant(Name: "青帶鳳蝶", Scientificname: "Graphium sarpedon", Sectionname: "鳳蝶科 Papilionidae", distributed: "廣布南亞、東南亞、日本、與澳洲地區", habits: "飛翔力強，常在低海拔的潮濕與開闊地帶活動，在庭園、街道及樹林空地也常見", image: "青帶鳳蝶")]
    var Nym:[Plant] = [Plant(Name: "姬小紋青斑蝶", Scientificname: "Parantica aglea", Sectionname: "蛺蝶科 Nymphalidae", distributed: "廣泛分布全島低中海拔山區，偏好出現於森林環境附近的荒地、林緣等處", habits: "其幼蟲取食歐蔓、布朗藤等植物，為多世代的種類，成蝶喜好訪花", image: "姬小紋青斑蝶"),
                       Plant(Name: "黃蛺蝶", Scientificname: "Polygonia c-aureum", Sectionname: "蛺蝶科 Nymphalidae", distributed: "分布於東亞地區，包括西伯利亞、中國東部、朝鮮半島、日本、台灣、東南亞、中南半島北部", habits: "本種幼蟲以大麻科植物葎草為食，一年多世代。", image: "黃蛺蝶"),
                       Plant(Name: "流星蛺蝶", Scientificname: "Dichorragia nesimachus", Sectionname: "蛺蝶科 Nymphalidae", distributed: "台灣地區分布於本島中低海拔地區", habits: "本種以清風藤科植物，如山豬肉、綠樟、筆羅子、紫珠葉泡花樹等為食", image: "流星蛺蝶")]
    
    var Pie:[Plant] = [Plant(Name: "斑粉蝶", Scientificname: "Prioneris thestylis", Sectionname: "粉蝶科 Pieridae", distributed: "主要分布從斯里蘭卡到華南地區及臺灣", habits: "偏好出現於闊葉林周邊的林緣、溪床、到路旁等環境，偏好訪花、吸水", image: "斑粉蝶"),
                       Plant(Name: "江崎黃蝶", Scientificname: "Eurema alitha", Sectionname: "粉蝶科 Pieridae", distributed: "本種為島嶼性物種，分布於東洋區、澳洲區島嶼，而不見於大陸", habits: "本種幼蟲以豆科細花乳豆為食，一年多世代，成蟲全年可見", image: "江崎黃蝶"),
                       Plant(Name: "端紅蝶", Scientificname: "Hebomoia glaucippe", Sectionname: "粉蝶科 Pieridae", distributed: "本種分布於東洋區，是東洋區體型最大的粉蝶科生物", habits: "本種幼蟲以魚木、毛瓣蝴蝶木、小刺山柑等植物為寄主喜好訪花或吸水", image: "端紅蝶")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isHidden = false
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return PlantNames.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdenifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdenifier, for: indexPath) as! PlantCell
        
        // Configure the cell...
        cell.nameLabel?.text = PlantNames[indexPath.row]
        cell.locationLabel?.text = PlantLocations[indexPath.row]
        cell.thumbnailImageView?.image = UIImage(named: PlantImage[indexPath.row])
        
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPlantDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! PlantDetailViewController
                if (tag == 0){
                    destinationController.plant = Pap[indexPath.row]
                }
                else if (tag == 1){
                    destinationController.plant = Nym[indexPath.row]
                }
                else if (tag == 2){
                    destinationController.plant = Pie[indexPath.row]
                }
            }
        }
    }
    
}
