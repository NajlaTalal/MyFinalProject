//
//  ImportantDates.swift
//  JobsApp
//
//  Created by Najla Talal on 1/2/22.
//

import UIKit
import Firebase
class ImportantDates: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var arr:[String] = [
        "اختبار القدرات" ,
        "اختبار الرخصة المهنية" ,
        "القبول الموحد للجامعات",
    "الاختبار التحصيلي",
        "اختبار القدرة المعرفية"
    ]
    
   
    
    @IBOutlet weak var ImpDateTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ImpDateTableView.delegate = self
        ImpDateTableView.dataSource = self
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ImpDatesCell
        cell.textLabel?.text = arr[indexPath.row]
        cell.layer.borderWidth = 0.5
        cell.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        cell.layer.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
     
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
               return 170
           } else {
               return 100
           }
       }
    


    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }
    
    
    //MARK: - SignOutButton
    
    @IBAction func Signout(_ sender: Any) {
        
        
        let alert = UIAlertController(title: "تنبيه", message: "هل أنت متأكد أنك تريد تسجيل الخروج؟", preferredStyle: .actionSheet)
              let action = UIAlertAction(title: "تسجيل الخروج", style: .destructive) { action in
                  
                  do {
                      try Auth.auth().signOut()
                      self.dismiss(animated: true, completion: nil)
                  } catch {
                      print(error.localizedDescription)
                  }
              }
              
              alert.addAction(action)
              alert.addAction(UIAlertAction(title: "إلغاء", style: .cancel, handler: nil))
              present(alert, animated: true, completion: nil)
//
//        let firebaseAuth = Auth.auth()
//    do {
//      try firebaseAuth.signOut()
//    } catch let signOutError as NSError {
//      print("Error signing out: %@", signOutError)
//    }
    }
    
}
