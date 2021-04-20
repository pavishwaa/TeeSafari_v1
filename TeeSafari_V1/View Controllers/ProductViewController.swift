//
//  ProductViewController.swift
//  TeeSafari_V1
//
//  Created by VISHWA PATEL on 4/19/21.
//

import UIKit

class ProductViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    // T-shirt names
    var listData = ["White Tee", "Puma Tee", "Pink Tee", "Purple Tee", "Yellow Tee"]
       
    // T-shirt prices
       var priceData = ["25", "23", "35", "30", "20"]
       
    // T-shirt images
       var imageData = [ UIImage(imageLiteralResourceName: "white"), UIImage(imageLiteralResourceName: "puma"), UIImage(imageLiteralResourceName: "pink"), UIImage(imageLiteralResourceName: "purple"), UIImage(imageLiteralResourceName: "puma")       ]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listData.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        let tableCell = tableView.dequeueReusableCell(withIdentifier: "cell") as?
            SiteCell ?? SiteCell (style: .default, reuseIdentifier: "cell")
        
        // Define row numbers and assigning values
        let rowNum = indexPath.row
        tableCell.primaryLabel.text = listData[rowNum]
        tableCell.secondaryLabel.text = priceData[rowNum]
        tableCell.myImageView.image = imageData[rowNum]
        
        tableCell.accessoryType = .disclosureIndicator
        
        return tableCell
        
    }
    
    // Take user on next page upon click
   // func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      //  let mainDelegate = UIApplication.shared.delegate as! AppDelegate
        
      //  mainDelegate.selectedURL = siteData[indexPath.row]
        
       // performSegue(withIdentifier: "ChooseSegueToView", sender: nil)
   // }
    
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}
