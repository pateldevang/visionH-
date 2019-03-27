//
//  DetailViewController.swift
//  visionH+
//
//  Created by Devang Patel on 26/03/19.
//  Copyright © 2019 Devang Patel. All rights reserved.
//

import UIKit
import Firebase
var items:[Float] = []
class DetailViewController: UIViewController {
    
    @IBOutlet weak var o2: UILabel!
    @IBOutlet weak var aq: UILabel!
    @IBOutlet weak var no2: UILabel!
    @IBOutlet weak var nh3: UILabel!
    @IBOutlet weak var co2: UILabel!
    @IBOutlet weak var co: UILabel!
    
    
    var ref2 : DatabaseReference?
    var handle2 : DatabaseHandle?
    var timer = Timer()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        fetch()
       timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(fetch), userInfo: nil, repeats: true)
        
        // Do any additional setup after loading the view.
    }
    
    @objc func fetch()
    {
        ref2 = Database.database().reference()
        handle2 = ref2?.child("list").observe(.childAdded, with: { (snapchat) in
            items.append(snapchat.value as! Float)
            if items.count == 6{
                print(items)
                    self.o2.text = String(items[0])
                    self.aq.text = String(items[1])
                    self.co.text = String(items[2])
                    self.co2.text = String(items[3])
                    self.nh3.text = String(items[4])
                    self.no2.text = String(items[5])
                    items = []
            }
        })
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
