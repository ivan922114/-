//
//  mapViewController.swift
//  暨大校園植物誌
//
//  Created by viplab on 2018/6/23.
//  Copyright © 2018年 viplab. All rights reserved.
//

import UIKit
import MapKit

class mapViewController: UIViewController, URLSessionDataDelegate{
    
    @IBOutlet var mapView: MKMapView!
    
    var pName = String()
    var plant = Plant()
    var locationss = Location()
    
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
                        self.locationss.lat = Lat! as! String
//                        print(self.locations.lat)
                    }
                    if let Lon = result["WGS84Lon"] {
                        self.locationss.lon = Lon! as! String
//                        print(self.locations.lon)
                    }
                    self.configure(location: self.locationss)
                }
            }
        }).resume()
    }
    
    func configure(location: Location){
        print("lat: ", locationss.lat, "\t" ,"lon: ", locationss.lon)
        let anntation = MKPointAnnotation()
        anntation.coordinate = CLLocation(latitude: atof(locationss.lat), longitude: atof(locationss.lon)).coordinate
        anntation.title = self.plant.Name
        anntation.subtitle = self.plant.habits
        self.mapView.addAnnotation(anntation)
//        let region = MKCoordinateRegionMakeWithDistance(anntation.coordinate, 250, 250)
//        self.mapView.setRegion(region, animated: false)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        getData(btfName: pName)
        
        print("===========")
        print(locationss.lat,"\t",locationss.lon)
        
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
