//
//  mapViewCell.swift
//  暨大校園植物誌
//
//  Created by viplab on 2018/6/22.
//  Copyright © 2018年 viplab. All rights reserved.
//

import UIKit
import MapKit

class mapViewCell: UITableViewCell {

    @IBOutlet var mapView: MKMapView!
    
    func configure(location: Location){
//        print(location.lat," ",location.lon)
        let anntation = MKPointAnnotation()
        anntation.coordinate = CLLocation(latitude: atof(location.lat), longitude: atof(location.lon)).coordinate
        self.mapView.addAnnotation(anntation)
        let region = MKCoordinateRegionMakeWithDistance(anntation.coordinate, 250, 250)
        self.mapView.setRegion(region, animated: false)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
