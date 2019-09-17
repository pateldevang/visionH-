//
//  sideViewController.swift
//  visionH+
//
//  Created by Devang Patel on 26/03/19.
//  Copyright © 2019 Devang Patel. All rights reserved.
//

import UIKit
import Firebase
class sideViewController: UIViewController {

    @IBOutlet var leadingC: NSLayoutConstraint!
    @IBOutlet var trailingC: NSLayoutConstraint!
    @IBOutlet weak var search: UISearchBar!
    @IBOutlet weak var ali: UIImageView!
    @IBOutlet weak var su: UIImageView!
    @IBOutlet weak var muk: UIImageView!
     @IBOutlet var ubeView: UIView!
    var hamburgerMenuIsVisible = false
    override func viewDidLoad() {
        super.viewDidLoad()
        intial()
        // Do any additional setup after loading the view.
    }
  
    @IBAction func hamburgerBtnTapped(_ sender: Any) {
        //if the hamburger menu is NOT visible, then move the ubeView back to where it used to be
        if !hamburgerMenuIsVisible {
            leadingC.constant = 300
            //this constant is NEGATIVE because we are moving it 150 points OUTWARD and that means -150
            trailingC.constant = -300
            
            //1
            hamburgerMenuIsVisible = true
        } else {
            //if the hamburger menu IS visible, then move the ubeView back to its original position
            leadingC.constant = 0
            trailingC.constant = 0
            
            //2
            hamburgerMenuIsVisible = false
        }
        
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        }) { (animationComplete) in

        }
    }
    
    func intial()
    {
        self.search.layer.borderWidth = 0.5
        self.search.layer.cornerRadius = 20.0
        self.search.clipsToBounds = true
        self.muk.clipsToBounds = true
        self.muk.layer.borderWidth = 1.3
        self.muk.layer.borderColor = UIColor.black.cgColor
        self.su.clipsToBounds = true
        self.su.layer.borderWidth = 1.3
        self.su.layer.borderColor = UIColor.black.cgColor
        self.ali.clipsToBounds = true
        self.ali.layer.borderWidth = 1.3
        self.ali.layer.borderColor = UIColor.black.cgColor
    }
    
    @IBAction func phone(_ sender: UIButton) {
        if let url = NSURL(string: "tel://8888888888"), UIApplication.shared.canOpenURL(url as URL) {
            UIApplication.shared.openURL(url as URL)
        }
    }
    
    @IBAction func logout(_ sender: UIButton) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            let homeView = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController")
            self.present(homeView!,animated: true,completion: nil)
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
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
