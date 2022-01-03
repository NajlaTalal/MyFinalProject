//
//  SignUpVC.swift
//  JobsApp
//
//  Created by Najla Talal on 1/1/22.
//

import UIKit
import Firebase
import FirebaseAuth
class SignUpVC: UIViewController {

    @IBOutlet weak var NameTF: UITextField!
    
    @IBOutlet weak var IDTF: UITextField!
    
    @IBOutlet weak var EmailTF: UITextField!
    
    @IBOutlet weak var PasswordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NameTF.placeholder = "Name"
        IDTF.placeholder = "ID"
        EmailTF.placeholder = "Email"
        PasswordTF.placeholder = "Password"
        
       }

    @IBAction func SignUpBu(_ sender: Any) {
        
  
        Auth.auth().createUser(withEmail: EmailTF.text!, password: PasswordTF.text!) {
            user, error in
            if error == nil {
                let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                changeRequest?.displayName = self.NameTF.text
                changeRequest?.commitChanges { (error) in
                    if error == nil {
                        print("displayName done")
                        print(Auth.auth().currentUser?.displayName)
                    }else{
                        print(error)
                    }
                    
                    self.performSegue(withIdentifier: "next", sender: nil) }
            }else{
                print("error",error?.localizedDescription)
            }
        }

}
}
