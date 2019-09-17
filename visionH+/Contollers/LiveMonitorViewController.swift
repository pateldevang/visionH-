//
//  LiveMonitorViewController.swift
//  visionH+
//
//  Created by Devang Patel on 27/03/19.
//  Copyright © 2019 Devang Patel. All rights reserved.
//

import UIKit

class LiveMonitorViewController: UIViewController {
    
    let arr = ["90","91","93","90","90","95","98","100","100","100","102","102","102","110","112","118","118","125","130","140","151","151","151","151","151","151","151","151","151","151","151","151","151","151","151","151","151","151","151","151","151","151","151","151","151","151","151","151","151","151"]
    let arr1 = ["108/69","108/69","110/69","110/71","115/79","115/81","115/81","115/81","120/79","120/79","120/79","120/81","120/81","120/79","118/79","118/79","118/79","118/79","118/79","118/79","130/79"]
    let arr2 = ["99","99.2","99.1","98.2","98.5","99.2","99.2","97.9","99.2","99.8","99.8","100.3","99.1","99.2","99.2","99.2","98.2","98.4","99.2","99.2","99.2","99.2","99.2","99.2","99.2","99.2","99.2","99.2","99.2","99.2","99.2","99.2","99.2","99.2","99.2","99.2","99.2","99.2"]
    let arr3 = ["18","17","17","17","16","16","16","17","17","18","18","17","17","17","17","16","16","16","16","17","17","17","17","17","17","17","17","17","17","17","17","17","17.3","17.3","17.3","17.3","17.3","17.3","17.3"]
    let arr4 = ["98.6","98.7","98.7","98.9","98.5","98.5","98.5","98.8","98.8","99.0","99.0","99.0","98.8","98.8","98.8","98.8","98.5","98.5","98.8","98.8","98.8","98.5","98.5","98.5","98.5","98.5","98.5","98.5","98.5","98.5","98.5","98.5","98.5","98.5","98.5","98.5","98.5"]
    var i = 0
    var timer = Timer()
    var tim = Timer()
    @IBOutlet weak var bloodp: UILabel!
    @IBOutlet weak var res: UILabel!
    @IBOutlet weak var temp: UILabel!
    @IBOutlet weak var satu: UILabel!
    @IBOutlet weak var blood: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        up()
        up1()
        timer = Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(up), userInfo: nil, repeats: true)
        tim = Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(up1), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view.
    }
    @objc func up1()
    {
        blood.text = arr1[i]
        satu.text = arr2[i]
        res.text = arr3[i]
        temp.text = arr4[i]
    }
    @objc func up()
    {
        if Int(arr[i])!>150
        {
            let alert = UIAlertController(title: "Warning", message: "High BP level", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .destructive, handler: nil))
            self.present(alert,animated: true,completion: nil)
        }
        else{
        bloodp.text = arr[i]
        i=i+1
        }
    }

    @IBAction func Stop(_ sender: Any) {
        i = 0
    }
    
     @IBAction func Stop1(_ sender: Any) {
        i = 0
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
