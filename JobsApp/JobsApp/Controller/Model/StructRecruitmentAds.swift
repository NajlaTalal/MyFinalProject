//
//  StructRecruitmentAds.swift
//  JobsApp
//
//  Created by Najla Talal on 1/4/22.
//

import Foundation
import Firebase

struct RAds {
    var title:String
    var Images:String
    var RecruitmentAds:String
    var categories:String
    
    init(title:String,Images:String,RecritmentAds:String,categories:String){
        
        self.title = title
        self.Images = Images
        self.RecruitmentAds = RecritmentAds
        self.categories = categories
    }
}
