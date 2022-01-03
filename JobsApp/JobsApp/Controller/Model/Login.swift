//
//  Login.swift
//  JobsApp
//
//  Created by Najla Talal on 1/2/22.
//

import UIKit
import Firebase

class Login: UIViewController {
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    

    @IBAction func LoginBu(_ sender: Any) {
      
        Auth.auth().signIn(withEmail: emailTF.text!, password: passwordTF.text!) { user, error in
            if error == nil {
                self.performSegue(withIdentifier: "move", sender: nil)
            }else{
                print("error",error?.localizedDescription)
            }
            }
            
        
    }
    
}
