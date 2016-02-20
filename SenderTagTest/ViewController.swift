//
//  ViewController.swift
//  SenderTagTest
//
//  Created by Karin on 2016/02/20.
//  Copyright © 2016年 Karin. All rights reserved.
//
import UIKit
import MapKit
class CustomMKPointAnnotation: MKPointAnnotation {
//    var pinColor: MKPinAnnotationColor!
    var senderTag: Int!
}

class ViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var map: MKMapView!
    @IBOutlet var dimage : UIImageView!
    var imageArray = [String]()
    var dlabelArray = [String]()
    @IBOutlet var dlabel:UILabel!
    

    override func viewDidLoad(){
        
        super.viewDidLoad()
        
        imageArray = ["image1.jpg","image2.jpg"]
        dlabelArray  = ["製パン王キムタック","チャングムの誓い"]

        
        map = MKMapView()
        map.frame = self.view.bounds
        map.delegate = self
        self.map.frame = CGRectMake(10,350,self.view.bounds.size.width-20,self.view.bounds.size.height/3)
        self.view.addSubview(map)
        
        
        // 中心点の緯度経度.
        let myLat: CLLocationDegrees = 35.681382
        let myLng: CLLocationDegrees = 139.766084
        let myCoordinate: CLLocationCoordinate2D = CLLocationCoordinate2DMake(myLat, myLng)
        
        // 縮尺.
        let myLatDist : CLLocationDistance = 0.1
        let myLngDist : CLLocationDistance = 0.1
        let span = MKCoordinateSpanMake(myLatDist, myLngDist)
        
        // Regionを作成.
        let myRegion: MKCoordinateRegion = MKCoordinateRegion(center: myCoordinate, span: span)
        
        // MapViewに反映.
        self.map.setRegion(myRegion, animated: true)
        
        
        // 標準の場合はこちら var testPin:MKPointAnnotation = MKPointAnnotation()
        let testPin:CustomMKPointAnnotation = CustomMKPointAnnotation()
        testPin.coordinate = myCoordinate
        testPin.title = "東京駅"
        testPin.subtitle = "新幹線はこっから"
//        testPin.pinColor = MKPinAnnotationColor.Red
        testPin.senderTag = 1
        map.addAnnotation(testPin)
        
        let testPin2:CustomMKPointAnnotation = CustomMKPointAnnotation()
        testPin2.coordinate = CLLocationCoordinate2DMake(35.698683, 139.774219)
        testPin2.title = "秋葉原駅"
        testPin2.subtitle = "アニメとゲームと電機の不思議な街♪"
//        testPin2.pinColor = MKPinAnnotationColor.Green
        testPin2.senderTag = 2
        map.addAnnotation(testPin2)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        
        if annotation is MKUserLocation {
            //return nil so map view draws "blue dot" for standard user location
            return nil
        }
        
        let reuseId = "pin"
        
        var pinView = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseId) as? MKPinAnnotationView
        if pinView == nil {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView!.canShowCallout = true
            pinView!.animatesDrop = true
//            pinView!.pinColor = (annotation as! CustomMKPointAnnotation).pinColor
            
            let rightButton: AnyObject! = UIButton(type:UIButtonType.DetailDisclosure)
            rightButton.titleForState(UIControlState.Normal)
            (rightButton as! UIButton).tag = (annotation as! CustomMKPointAnnotation).senderTag
            
            rightButton.addTarget(self, action: "rightButtonTapped:", forControlEvents: UIControlEvents.TouchUpInside)
            pinView!.rightCalloutAccessoryView = rightButton as? UIView
            
        }
        else {
            pinView!.annotation = annotation
        }
        return pinView
    }
    
    func rightButtonTapped(sender: UIButton!){
        print("タッチ")
        print(sender.tag)
        dimage.image = UIImage(named: imageArray[sender.tag - 1])
        print(imageArray[sender.tag - 1])
        dlabel.text = dlabelArray[sender.tag - 1]
        
    }
}