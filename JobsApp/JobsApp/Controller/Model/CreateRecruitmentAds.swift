//
//  RecruitmentAds.swift
//  JobsApp
//
//  Created by Najla Talal on 1/2/22.
//

import UIKit
import Firebase
import FirebaseStorage
class CreateRecruitmentAds: UIViewController {
    
    @IBOutlet weak var titleTF: UITextField!
    
    @IBOutlet weak var adsImage: UIImageView!
    
    @IBOutlet weak var imagebu: UIButton!
    @IBOutlet weak var categories: UISegmentedControl!
    
    @IBOutlet weak var adsTV: UITextView!
    
    @IBOutlet weak var dateOfRAdsLabel: UILabel!
    
    let db = Firestore.firestore()
    let firestoreURL = Firestore.firestore()
    let username = Auth.auth().currentUser?.displayName
    var date = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        date = dateToSring()
    }
    
    @IBAction func addBu(_ sender: Any) {
        
        firestoreURL.collection("RecruitmentAdv")
            .addDocument(data: [
                "title": titleTF.text! ,
                "RecruitmentAdv": adsTV.text!,
                "dateOfRAds": date,
                
                
                //                "Images":adsImage.image ,
                //                "categories": categories!
            ])
        { (error) in
            if let e = error {
                print(e.localizedDescription)
                
            } else {
                
                print("Successfully saved data")
            }
        }
        
    }
    
    @IBAction func getImage(_ sender: Any) {
       
}
}
