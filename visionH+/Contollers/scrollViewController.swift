//
//  scrollViewController.swift
//  visionH+
//
//  Created by Devang Patel on 27/03/19.
//  Copyright © 2019 Devang Patel. All rights reserved.
//

import UIKit

class scrollViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func opop(_ sender: UIButton) {
        let popOvervc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "popview") as! PopViewController
        self.addChild(popOvervc)
        popOvervc.view.frame = self.view.frame
        self.view.addSubview(popOvervc.view)
        popOvervc.didMove(toParent: self)
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
