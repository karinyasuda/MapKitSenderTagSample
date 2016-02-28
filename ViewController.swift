//
//  ViewController.swift
//  SenderTagTest
//
//  Created by Karin on 2016/02/23.
//  Copyright © 2016年 Karin. All rights reserved.
//
import UIKit
import MapKit
protocol ModalViewControllerDelegate{
    func modalDidFinished(modalText: AnyObject)
}

class ViewController: UIViewController ,UITableViewDataSource, UITableViewDelegate,UISearchBarDelegate,UITextFieldDelegate{
    
    var delegate: ModalViewControllerDelegate! = nil//delegateをつかった　がめん間の値渡し
    
    @IBOutlet weak var tableView: UITableView!//tableviewをアウトレット接続で宣言
    var index:Int = 0
    
    
    // MARK: - plan内容関連 -
    @IBOutlet var titlelabel:UILabel!//いまは、titlelabelに文字を表示して、その文字をもとに配列のなかでどれを取っているのか
    @IBOutlet var gobutton:UIButton!//Delegate View Controller に画面遷移
//    var cellimage:UIImageView!
    
    // TODO:だめ！場所の直打ち
    let dramaArray = ["製パン王キム・タック","チャングムの誓い","星から来たあなた","奇皇后","イ・サン","太陽を抱く月"]
//    ["製パン王キム・タック","チャングムの誓い", "華麗なる遺産", "星から来たあなた",  "家族なのにどうして", "奇皇后","太陽を抱く月","ハイド ジキル、私","イ・サン","トンイ"]
    let imageArray = ["image1.jpg","image2.jpg","image4.jpg","image6.jpg","image9.jpg","image7.jpg"]
//    ["image1.jpg","image2.jpg","image3.jpg","image4.jpg","image5.jpg","image6.jpg","image7.jpg","image8.jpg","image9.jpg","image10.jpg"]
    
    
    //searchするときのtmpらしい
    var filteredTableData = [String]()
    //SearchControllerインスタンス
    var resultSearchController = UISearchController()
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.hidesBarsOnTap = true
//        navigationController.barTintColor = [UIColor];  // バ
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    
    // MARK: - TableView関連 -
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dramaArray.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("placeCell", forIndexPath: indexPath)
        //id が　placecellとあるものの中で、使い回しできるものを返してUiTableViewの　placeCellの中に
        
        //cellのtextlabelはplaceArrayから。
        cell.textLabel?.text=dramaArray[indexPath.row]
        cell.imageView?.image = UIImage(named: imageArray[indexPath.row])
//        cell.imageView? = CGRect(10,0,30,cell.bounds.size.height)
        
        //        if cell.accessoryType == .None {
        //            cell.accessoryType = .Checkmark}
        //
        
        
        
        return cell
    }
    
    
    // MARK: - cellが選択されたら -
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("セルを選択しました！ #\(indexPath.row)!")
        //titlelabelに題名表示、
        titlelabel.text = dramaArray[indexPath.row]
        print (titlelabel.text)
        index = dramaArray.indexOf(titlelabel.text!)!
        print(index)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "toDetail") {
            
            let detailView = segue.destinationViewController as! DetailViewController
            detailView.dramaArray = self.dramaArray
            //            resultView.dramalabel.text = self.titlelabel.text
            detailView.index = self.index//イコールの数でエラーでてた？
        }
    }
        
    


    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

