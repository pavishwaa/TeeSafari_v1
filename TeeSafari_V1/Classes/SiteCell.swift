//
//  SiteCell.swift
//  W8SwiftTables2
//
//  Created by Vishwa Patel on 19-04-2021.
//  Copyright © 2018 Jawaad Sheikh. All rights reserved.
//

import UIKit

class SiteCell: UITableViewCell {
    
    // step 11 - define 2 labels and an image view for our custom cell
    let primaryLabel = UILabel()
    let secondaryLabel = UILabel()
    let myImageView = UIImageView()
    
    // step 11b - override the following constructor
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        // step 11c - configure primaryLabel
        primaryLabel.textAlignment = NSTextAlignment.left
        primaryLabel.font = UIFont.boldSystemFont(ofSize: 24)
        primaryLabel.backgroundColor = UIColor.clear
        primaryLabel.textColor = UIColor.black
        
        // step 11d - configure secondaryLabel
       secondaryLabel.textAlignment = NSTextAlignment.left
        secondaryLabel.font = UIFont.boldSystemFont(ofSize: 16)
        secondaryLabel.backgroundColor = UIColor.clear
        secondaryLabel.textColor = UIColor.orange
        
        
        // step 11e - no configuring of myImageView needed, instead add all 3 items manually as below
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(primaryLabel)
        contentView.addSubview(secondaryLabel)
        contentView.addSubview(myImageView)
    }
    
    // define size and location of all 3 items as below
    // return to ChooseSiteViewController.swift
    override func layoutSubviews() {
        
        primaryLabel.frame = CGRect(x: 100, y: 5, width: 460, height: 30)
        secondaryLabel.frame = CGRect(x: 100, y: 30, width: 460, height: 20)
        myImageView.frame = CGRect(x: 5, y: 5, width: 50, height: 50)
    }
    
    // step 11f - override base constructor to avoid compile error
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
