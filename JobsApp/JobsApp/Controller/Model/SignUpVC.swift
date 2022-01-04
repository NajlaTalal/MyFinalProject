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
extension AuthErrorCode {
    var description: String? {
        switch self {
        case .emailAlreadyInUse:
                return "الايميل مسجل مسبقا"
        case .userDisabled:
                return "المستخدم غير نشط حاليا"
        case .operationNotAllowed:
                return "العملية غير معتمدة"
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
        case .tooManyRequests:
                return "لقد أرسلت عددًا كبيرًا جدًا من الطلبات إلى الخادم. أرجو الإنتظار"
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
