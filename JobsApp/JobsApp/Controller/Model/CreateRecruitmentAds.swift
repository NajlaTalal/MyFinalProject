//
//  RecruitmentAds.swift
//  JobsApp
//
//  Created by Najla Talal on 1/2/22.
//

import UIKit
import Firebase

class CreateRecruitmentAds: UIViewController {

    @IBOutlet weak var titleTF: UITextField!
    
    @IBOutlet weak var adsImage: UIImageView!
    
    @IBOutlet weak var categories: UISegmentedControl!
    
    @IBOutlet weak var adsTV: UITextView!
    
    let firestoreURL = Firestore.firestore()
       let username = Auth.auth().currentUser?.displayName
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
    }
    
    @IBAction func addBu(_ sender: Any) {
        
        firestoreURL.collection("RecruitmentAdv")
                 .addDocument(data: [
                 "RecruitmentAdv": adsTV.text!,
                 "title": titleTF.text! ,
//                 "Images":adsImage.image! ,
//                 "categories": categories.se!
                 ])
        { (error) in
                  if let e = error {
                      print(e.localizedDescription)
               
                  } else {
                 
                   print("Successfully saved data")
                  }
                 }

    }
   
}

