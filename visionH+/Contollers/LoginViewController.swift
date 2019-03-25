//
//  LoginViewController.swift
//  
//
//  Created by Devang Patel on 26/03/19.
//

import UIKit
import Firebase
class LoginViewController: UIViewController {

    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var Pass: UITextField!
    @IBOutlet weak var load: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.load.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func Sign(_ sender: UIButton) {
        self.load.startAnimating()
        self.load.isHidden = false
        let email = Email.text
        let pass = Pass.text
        Auth.auth().signIn(withEmail: email!, password: pass!, completion: { user, error in
            
            if let firebaseError = error {
                self.load.isHidden = true
                print(firebaseError.localizedDescription)
                let alert = UIAlertController(title: "Authentication failed", message: "Invalid password please try again", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true)
                return
            }
            let homeView = self.storyboard?.instantiateViewController(withIdentifier: "PatientViewController") as! PatientViewController
            self.present(homeView, animated: true, completion: nil)
            print("Success!")
            
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
