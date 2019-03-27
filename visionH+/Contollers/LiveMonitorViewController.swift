//
//  LiveMonitorViewController.swift
//  visionH+
//
//  Created by Devang Patel on 27/03/19.
//  Copyright © 2019 Devang Patel. All rights reserved.
//

import UIKit

class LiveMonitorViewController: UIViewController {
    
    let arr = ["89","90","91","90","104","125","130","151","151","151","151","151","151","151","151","151","151","151","151","151","151","151","151","151","151","151","151","151","151","151","151","151","151","151","151","151","151","151","151","151","151","151","151","151","151","151","151","151","151","151","151","151","151"]
    var i = 0
    var timer = Timer()
    @IBOutlet weak var bloodp: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        up()
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(up), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view.
    }
    @objc func up()
    {
        bloodp.text = arr[i]
        i=i+1
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
