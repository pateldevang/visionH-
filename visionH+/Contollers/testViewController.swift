//
//  testViewController.swift
//  
//
//  Created by Devang Patel on 26/03/19.
//

import UIKit
import Firebase
class testViewController: UIViewController {
    
    @IBOutlet weak var outi: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let storage = Storage.storage()
//        let storageRef = storage.reference()
        let gsReference = storage.reference(forURL: "gs://visionh-cd104.appspot.com/Screen.png")
        // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
        gsReference.getData(maxSize: 1 * 1024 * 1024) { data, error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                // Data for "images/island.jpg" is returned
                let im = UIImage(data: data!)
                self.outi.image = im
            }
        }

        // Do any additional setup after loading the view.
    }
    override var prefersStatusBarHidden: Bool{
        return true
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
