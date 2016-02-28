//
//  DetailViewController.swift
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

class DetailViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet var map: MKMapView!
    
    var imageArray = [String]()//画像表示
    var dlabelArray = [String]()//ドラマ名表示
    var dramaArray = []//ドラマ名
    var nameArray = [String]()//場所の名前
    var name2Array = [String]()//日本語で表す場所の名前
    var addressArray = [String]()//住所
    var addressArray2 = [String]()//住所（日本語）
    var textArray = [String]()
    var index  = Int!()
    var LatDist:Double! = 0
    var LngDist:Double! = 0
    
    @IBOutlet var dimage : UIImageView!//スポットの写真を表示するためのimageview
    @IBOutlet var dlabel:UILabel!//ドラマ名表示用ラベル
    @IBOutlet var tobackButton : UIButton!//一画面目に戻るボタン
    @IBOutlet var nameLabel : UILabel!
    @IBOutlet var name2Label : UILabel!
    @IBOutlet var textView : UITextView!
    @IBOutlet var address : UILabel!
    @IBOutlet var address2 : UILabel!
    
    @IBOutlet var button: UIButton!

    override func viewDidLoad(){
        
        navigationController?.hidesBarsOnTap = true
        
        print("indexは、、\(index)!")
        super.viewDidLoad()
//        button.image = UINavigationBarbackIndicatorImage(named: "barbutton2.png")
        
        dlabelArray  = ["製パン王キム・タック","チャングムの誓い","星から来たあなた","奇皇后","イ・サン","太陽を抱く月"]
       
        nameArray = [
            "팔봉제빵점",//1
            "운보의 집",//2
            "용인 대장금 파크",//3
            "장사도해상공원",//4
            "인천대학교 송도캠퍼스",//5
            "창원해양드라마셋트장",//6
            "화성 융릉과 건릉",//7
            "한국민속촌"
        ]
        name2Array = [
            "パルボン製パン店",//1
            "タック母の家",//2
            "龍仁大長今パーク",//3
            "長蛇島海上公園",//4
            "仁川大学校松島キャンパス",//5
            "昌原海洋ドラマセット場",//6
            "隆陵・健陵",//7
            "韓国民族村"//8
        ]
        imageArray = [
            "place1.jpg",
            "place2.jpg",
            "place3.jpg",
            "place4.jpg",
            "place5.jpg",
            "place6.jpg",
            "place7.jpg",
            "place8.jpg",
        ]
        addressArray = [
            "충청북도 청주시 상당구 수동 81-35",//1
            "충청북도 청원군 내수읍 형동리 428-2",//2
            "경기도 용인시 처인구 백암면 용천리 778-1",//3
            "경상남도 통영시 한산면 매죽리산 4-1",//4
            "인천광역시 연수구 아카데미로 (송도동)119",//5
            "경상남도 창원시 마산합포구 구산면 석곡리산183-2",//6
            "경기도 화성시 효행로481번길 (안녕동) 21",//7
            "경기도 용인시 기흥구 보라동 35"//8
        ]
        addressArray2 = [
            "忠淸北道 淸州市 上党区 壽洞 81-35",//1
            "",//2
            "京畿道　龍仁市　処仁区　白岩面　龍川里 778−1",//3
            "慶尚南道 統営市 閑山面 梅竹里山 4-1",//4
            "仁川広域市　延寿区　学院路（松岛洞）119",//5
            "慶尚南道 昌原市 馬山合浦区 石谷里山183-2",//6
            "京畿道 華城市 孝行路 481番道（安寧洞）21",//7
            "京畿道 龍仁市 器興区 甫羅洞 35"//8
        ]
        textArray = ["『製パン王キム・タック』の舞台となったパン屋さん","","","","","","",""]
            
//        [
//        "1",
//        "2",
//        "3",
//        "4",
//        "5",
//        "6",
//        "7",
//        "8"]
        
        
        dlabel.text = dlabelArray[index]
        
        map = MKMapView()
//        map.frame = self.view.bounds
        map.delegate = self
        self.map.frame = CGRectMake(18,self.view.bounds.size.height - self.view.bounds.size.height/3 - 30,self.view.bounds.size.width-34,self.view.bounds.size.height/3)
        self.view.addSubview(map)
        
        
        // 中心点の緯度経度.
        let myLat: CLLocationDegrees = 36.830330
        let myLng: CLLocationDegrees = 127.593436
        let myCoordinate: CLLocationCoordinate2D = CLLocationCoordinate2DMake(myLat, myLng)
        
        // 縮尺.
        let LatDist : CLLocationDistance = 3
        let LngDist : CLLocationDistance = 3
        let span = MKCoordinateSpanMake(LatDist, LngDist)
        
        
        // Regionを作成.
        let myRegion: MKCoordinateRegion = MKCoordinateRegion(center: myCoordinate, span: span)
        
        // MapViewに反映.
        self.map.setRegion(myRegion, animated: true)
        
        
        //MARK: ピンを立てる！
        //MARK: 1キムタック
        let Pin01:CustomMKPointAnnotation = CustomMKPointAnnotation()
        Pin01.coordinate =  CLLocationCoordinate2DMake(36.647336, 127.494273)
        Pin01.title = "팔봉제빵점"
        Pin01.subtitle = "パルボン製パン店"
        Pin01.senderTag = 1
        //충청북도 청주시 상당구 수동81-35
        //忠淸北道 淸州市 上党区 壽洞 81-35
       
        let Pin02:CustomMKPointAnnotation = CustomMKPointAnnotation()
        Pin02.coordinate = CLLocationCoordinate2DMake(36.691392, 127.564538)
        Pin02.title = "운보의 집"
        Pin02.subtitle = "タック母の家（雲甫の家）"
        Pin02.senderTag = 2
        //충청북도 청원군 내수읍 형동리 428-2
        
        
        
        //MARK: 2チャングムの誓い
        let Pin11:CustomMKPointAnnotation = CustomMKPointAnnotation()
        Pin11.coordinate = CLLocationCoordinate2DMake(37.121341, 127.337007)
        Pin11.title = "용인 대장금 파크"
        Pin11.subtitle = "龍仁大長今パーク"
        Pin11.senderTag = 3
        //경기도 용인시 처인구 백암면 용천리 778-1
        //京畿道 龍仁市 処仁区 白岩面 湧泉里 778-1
        
        
        
        //MARK: 3"星から来たあなた"
        let Pin21:CustomMKPointAnnotation = CustomMKPointAnnotation()
        Pin21.coordinate = CLLocationCoordinate2DMake(34.849210, 128.593130)
        Pin21.title = "장사도해상공원"
        Pin21.subtitle = "長蛇島海上公園"
        Pin21.senderTag = 4
        //경상남도 통영시 한산면 매죽리 산4-1
        //慶尚南道 統営市 閑山面 梅竹里山 4-1
        
        
        let Pin22:CustomMKPointAnnotation = CustomMKPointAnnotation()
        Pin22.coordinate = CLLocationCoordinate2DMake(37.378528, 126.633126)
        Pin22.title = "인천대학교 송도캠퍼스"
        Pin22.subtitle = "仁川大学校　松島キャンパス"
        Pin22.senderTag = 5
        //仁川広域市　延寿区　学院路（松岛洞）119号
        //인천광역시 연수구 아카데미로 (송도동)119
        
        
        //MARK: 4"奇皇后"
        let Pin31:CustomMKPointAnnotation = CustomMKPointAnnotation()
        Pin31.coordinate = CLLocationCoordinate2DMake(34.849210, 128.593130)
        Pin31.title = "창원해양드라마셋트장"
        Pin31.subtitle = "昌原海洋ドラマセット場"
        Pin31.senderTag = 6
        //경상남도 창원시 마산합포구 구산면 석곡리 산183-2
        //慶尚南道 昌原市 馬山合浦区 石谷里 山183-2
        
        
        
        //MARK: 5"イ・サン"
        let Pin41:CustomMKPointAnnotation = CustomMKPointAnnotation()
        Pin41.coordinate = CLLocationCoordinate2DMake(34.849210, 128.593130)
        Pin41.title = "화성 융릉과 건릉"
        Pin41.subtitle = "隆陵・健陵"
        Pin41.senderTag = 7
        //京畿道 華城市 ヒョヘン路481番ギル21（安寧洞）
        //경기도 화성시 효행로 481번길 21 (안녕동)
        
        
       
        //MARK: 6太陽を抱く月
        
        let Pin51:CustomMKPointAnnotation = CustomMKPointAnnotation()
        Pin51.coordinate = CLLocationCoordinate2DMake(37.269279, 127.120288)
        Pin51.title = "한국민속촌"
        Pin51.subtitle = "韓国民俗村"
        Pin51.senderTag = 8
        
        
        //
        //
        //
        ////MARK: 家族なのに
        //let Pin41:CustomMKPointAnnotation = CustomMKPointAnnotation()
        //Pin41.coordinate = CLLocationCoordinate2DMake(37.121341, 127.337007)
        //Pin41.title = "하루엔소쿠"
        //Pin41.subtitle = "春の遠足"
        //Pin41.senderTag = 4
        //住所서울특별시 강남구 신사동 639
        //ソウル特別市 江南区 新沙洞 639
        
        
        
        
        
        //"ハイド ジキル
        //私",,

        
        
        
        
        
        
        
        
        if (index == 0){//製パン王
            
            map.addAnnotation(Pin01)//パルボン製パン店
            map.addAnnotation(Pin02)//キムタック母の家
    
            
            
        }
        if (index == 1){//チャングム
            
            map.addAnnotation(Pin11)//龍仁大長今パーク
            
        }
        if (index == 2){//星から
            map.addAnnotation(Pin21)//長蛇島海上公園
            map.addAnnotation(Pin22)//仁川大学校　松島キャンパス
            
        }
        if (index == 3){//奇皇后
            
            map.addAnnotation(Pin31)
            
        }
       
        if (index == 4){//イサン
            
            map.addAnnotation(Pin41)//お墓
            
        }
        
         if (index == 5){//太陽
            
            map.addAnnotation(Pin51)//韓国民俗村
            map.addAnnotation(Pin11)//チャングムパーク？
        }
        
        
        
//        if (index == 2){//華麗なる遺産
//            
//        }
//        if (index == 3){//星から来たあなた
//            
//        }
//        if (index == 4){//家族なのにどうして
//
//        }
//        if (index == 5){//奇皇后
//            
//        }
//        if (index == 6){//太陽を抱く月
//            
//        }
//        if (index == 7){//ハイドジキル
//            
//        }
//        if (index == 8){//イサン
//            
//        }
//        if (index == 9){//トンイ
//            
//        }
//       
        
        
        
        
        
        
        
    }
    
//    //戻るボタン
//    @IBAction func toback(){
//        self.dismissViewControllerAnimated(true, completion: nil)
//    }
//    
    
    
    
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
        
         LatDist = 0.5
         LngDist = 0.5
        
        print(sender.tag)
        dimage.image = UIImage(named: imageArray[sender.tag - 1])//画像
        print(imageArray[sender.tag - 1])
        dlabel.text = dramaArray[index] as? String
        nameLabel.text = nameArray[sender.tag - 1]//名前
        name2Label.text = name2Array[sender.tag - 1]//日本語
        address.text = addressArray[sender.tag - 1]
        address2.text = addressArray2[sender.tag - 1]
        textView.text = textArray[sender.tag - 1]
        
    }
}