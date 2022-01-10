//
//  GovernmentalJobs.swift
//  JobsApp
//
//  Created by Najla Talal on 1/3/22.
//

import UIKit
import Firebase
import SwiftUI

class GovernmentalJobs: UIViewController {
    let now = Date()
    let pastDate = Date(timeIntervalSinceNow: -60 * 60 * 24)
    var dateOfRAds = ""
    let db = Firestore.firestore()
    var hr : [RAds] = []
    let ID = Auth.auth().currentUser?.uid
   
//  
//    private let button: UIButton = {
//        let button = UIButton()
//        button.backgroundColor = .link
//        button.setTitle("Tap Me", for: .normal)
//        button.setTitleColor(.white, for: .normal)
//       return button
//    }()

    weak var collectionView: UICollectionView!
    
    
   
    override func loadView() {
        super.loadView()
        
       
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ])
        
        self.collectionView = collectionView
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        let titlelab = UILabel()
        titlelab.text = "الوظائف الحكومية"
        titlelab.frame = CGRect(x: 20, y: 70 , width:350, height: 25)
        titlelab.textAlignment = .center
        titlelab.textColor = #colorLiteral(red: 0.0257745944, green: 0.05412763357, blue: 0.2478517592, alpha: 1)
        titlelab.font = .boldSystemFont(ofSize: 20)
        view.addSubview(titlelab)
//        button.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
//        button.center = view.center
//        button.addTarget(self, action: #selector(presentShareSheet(_:)), for: .touchUpInside)
//        view.addSubview(button)
        self.collectionView.backgroundColor = .white
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(GovJobsCell.self, forCellWithReuseIdentifier: "MyCell")
      
        
        readdata()
        pastDate.timeAgoDisplay()
        dateToSring()
        
    }
    func readdata() {
        db.collection("RecruitmentAdv")
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    
                    for document in querySnapshot!.documents {
                        let data = document.data()
                        self.hr.append(RAds(title: data["title"] as! String, Images: "Images", RecritmentAds: data["RecruitmentAdv"] as? String ?? "" ,categories: "categories", dateOfRAds: data["dateOfRAds"] as? String ?? ""))
                        print(self.hr)
                        self.collectionView.reloadData()
                    }
                    
                }
            }
    }
    
}

extension GovernmentalJobs: UICollectionViewDataSource {
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! GovJobsCell
        
        cell.recAdsLabel.text = hr[indexPath.row].RecruitmentAds
        cell.titleLabel.text = hr[indexPath.row].title
        let date = stringToDate(Date: hr[indexPath.row].dateOfRAds)
        cell.dateOfRAdsLabel.text = date
        cell.ShareButton.addTarget(self, action: #selector(presentShareSheet(_:)), for: .touchUpInside)
        
        
        cell.layer.borderWidth = 1
        cell.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        return cell
    }
    @objc func presentShareSheet(_ sender: UIButton) {
        guard let image = UIImage(systemName: "bell"),
              let url = URL(string: "https://www.google.com") else {
            return
        }
//
        let shareSheetVC = UIActivityViewController(
            activityItems: [
                image,
                url
            ], applicationActivities: nil)

      present(shareSheetVC , animated: true )
       
}
}

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let select = RAds[indexPath.row]
//        let  viewCommunities = ViewCommunities()
//        viewCommunities.arrCommunities = select
//        present(viewCommunities , animated: true , completion: nil)
       
    }
}


extension GovernmentalJobs: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: collectionView.bounds.size.width - 16, height: 130)
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 40
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top:180, left: 8, bottom: 0, right: 8)
    }
    func collectionView(_ collectionView: UICollectionView, titleForHeaderInSection section: Int) -> String? {
        return "Numeros"
    }
 
   
}
    
//    @objc private func presentShareSheet(_ sender: UIButton) {
//        guard let image = UIImage(systemName: "bell"),
//              let url = URL(string: "https://www.google.com") else {
//            return
//        }
//        
//        let shareSheetVC = UIActivityViewController(
//            activityItems: [
//                image,
//                url
//            ], applicationActivities: nil)
//        
//        
//        // These two lines suport iPad
//        shareSheetVC.popoverPresentationController?.sourceView = sender
//        shareSheetVC.popoverPresentationController?.sourceRect = sender.frame
//        
//        present(shareSheetVC, animated: true)
//    
//}

//extension UIView {
//
//    func pin(to superView: UIView){
//        translatesAutoresizingMaskIntoConstraints                                             = false
//        topAnchor.constraint(equalTo: superView.topAnchor, constant: 150).isActive            = true
//        leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: 15).isActive     = true
//        trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: -15).isActive  = true
//        bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: -50).isActive      = true
//    }
//
//}

extension Date {
    func timeAgoDisplay() -> String {
        let secondsAgo = Int(Date().timeIntervalSince(self))
        let minute = 60
        let hour = 60 * minute
        let day = 24 * hour
        let week = 7 * day
        if secondsAgo < minute {
            return "\(secondsAgo) seconds ago"
        } else if secondsAgo < hour {
            return "\(secondsAgo / minute) minutes ago"
        } else if secondsAgo < day {
            return "\(secondsAgo / hour) hours ago"
        } else if secondsAgo < week {
            return "\(secondsAgo / day) days ago"
        }
        return "\(secondsAgo / week) weeks ago"
        
        
    }
}







