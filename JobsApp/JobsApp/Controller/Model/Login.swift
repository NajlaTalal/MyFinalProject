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
        emailTF.setLeftImage(imageName: "envelope")
        emailTF.setUnderLine()
        passwordTF.setLeftImage(imageName: "lock")
        passwordTF.setUnderLine()
        
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

extension UITextField{

    func setLeftImage(imageName:String) {

        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.image = UIImage(named: imageName)
        self.leftView = imageView;
        self.leftViewMode = .always
    }
}
