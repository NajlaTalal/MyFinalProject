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
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
               return 170
           } else {
               return 100
           }
       }
    
    @IBAction func Signout(_ sender: Any) {
        
        let firebaseAuth = Auth.auth()
    do {
      try firebaseAuth.signOut()
    } catch let signOutError as NSError {
      print("Error signing out: %@", signOutError)
    }
    }
    
}
