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
    
    let showPasswordButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NameTF.setUnderLine()
        IDTF.setUnderLine()
        EmailTF.setUnderLine()
        PasswordTF.setUnderLine()
        showPasswordButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        showPasswordButton.tintColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        showPasswordButton.frame = CGRect(x: 25, y: 460, width: 60, height: 60)
        showPasswordButton.addTarget(self, action: #selector(hidePassword), for: .touchUpInside)
        view.addSubview(showPasswordButton)
        NameTF.placeholder = "الاسم"
        IDTF.placeholder = "الهوية الوطنية"
        EmailTF.placeholder = "البريد الإلكتروني"
        PasswordTF.placeholder = "كلمة المرور"
        hideKeyboardWhenTappedAround()
//        self.view.addBackground()
        
       }
    
    @objc func hidePassword() {
        PasswordTF.isSecureTextEntry.toggle()
        if PasswordTF.isSecureTextEntry {
                   showPasswordButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
               } else {
                   showPasswordButton.setImage(UIImage(systemName: "eye"), for: .normal)
               }
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
extension AuthErrorCode {
    var description: String? {
        switch self {
        case .emailAlreadyInUse:
                return "الايميل مسجل مسبقا"
        case .userDisabled:
                return "المستخدم غير نشط حاليا"
//        case .operationNotAllowed:
//                return "العملية غير معتمدة"
        case .invalidEmail:
                return "صيغة الايميل غير صحيحه"
        case .wrongPassword:
                return "كلمة المرور غير صحيحه"
        case .userNotFound:
                return "لم يتم العثور على حساب مستخدم"
        case .networkError:
                return "حدث خطأ في الشبكة. حاول مرة اخرى"
        case .weakPassword:
                return "كلمة المرور ضعيفه"
        case .missingEmail:
                return "الرجاء إدخال عنوان البريد الإلكتروني الخاص بك"
        case .internalError:
                return "خطأ داخلي يرجى المحاولة مرة أخرى"
        case .invalidCustomToken:
                return "الرمز غير صالح"
//        case .tooManyRequests:
//                return "لقد أرسلت عددًا كبيرًا جدًا من الطلبات إلى الخادم. أرجو الإنتظار"
        default:
            return nil
        }
    }
}

public extension Error {
    var localizedDescription: String {
        let error = self as NSError
        if error.domain == AuthErrorDomain {
            if let code = AuthErrorCode(rawValue: error.code) {
                if let errorString = code.description {
                    return errorString
                }
            }
        }
        return error.localizedDescription
    } }

extension UIViewController {
    
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

//
//extension UIView {
//func addBackground() {
//    // screen width and height:
//    let width = UIScreen.main.bounds.size.width
//    let height = UIScreen.main.bounds.size.height
//
//    let imageViewBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
//    imageViewBackground.image = UIImage(named: "background.jpg")
//
//    // you can change the content mode:
//    imageViewBackground.contentMode = UIView.ContentMode.scaleAspectFill
//
//    self.addSubview(imageViewBackground)
//    self.sendSubviewToBack(imageViewBackground)
//}}

extension UITextField {

    func setUnderLine() {
        let border = CALayer()
        let width = CGFloat(0.5)
        border.borderColor = UIColor.darkGray.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width - 10, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }

}
