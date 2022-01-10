//
//  GovJobsCell.swift
//  JobsApp
//
//  Created by Najla Talal on 1/3/22.
//

import UIKit



class GovJobsCell: UICollectionViewCell {
    
    
                                    
    let titleLabel = UILabel(frame: CGRect(x: 100, y: 30,  width: 250 , height: 15 ))
    let recAdsLabel = UILabel(frame: CGRect(x: 100, y: 50,  width: 250 , height: 15 ))
    let dateOfRAdsLabel = UILabel(frame: CGRect(x: 10, y: 5,  width: 120 , height: 30 ))
    let shareButton = UIButton(frame: CGRect(x: 10, y: 5,  width: 120 , height: 30 ))
    
      private let button: UIButton = {
          let button = UIButton()
          button.backgroundColor = .link
          button.setTitle("Tap Me", for: .normal)
          button.setTitleColor(.white, for: .normal)
         return button
      }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let textLabel = UILabel(frame: .zero)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(textLabel)
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            textLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            textLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            textLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            
        ])
        
        self.contentView.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        contentView.addSubview(shareButton)
        contentView.addSubview(titleLabel)
        contentView.addSubview(recAdsLabel)
        contentView.addSubview(dateOfRAdsLabel)
        recAdsLabel.textAlignment = .right
        titleLabel.textAlignment = .right
        dateOfRAdsLabel.textAlignment = .left
        recAdsLabel.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        dateOfRAdsLabel.textColor = #colorLiteral(red: 0.8376267552, green: 0.8667850494, blue: 0.8665921092, alpha: 1)
        recAdsLabel.font = UIFont(name: "Tajawal-Medium", size: 18)
        titleLabel.font = UIFont(name: "Tajawal-Medium", size: 15)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        fatalError("Interface Builder is not supported!")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        fatalError("Interface Builder is not supported!")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        
    }
}

