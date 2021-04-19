//
//  ViewController.swift
//  TeeSafari_V1
//  Author Jeel Patel
 // Student Id: 991548626
//  Created by  on 4/6/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var lblLogin : UILabel!
    @IBOutlet var lblAccount : UILabel!
    
    // This methods is based on touch events which allows user to fuether navigate to different page
    // Just by touch of labels.
     
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        let touch : UITouch = touches.first!
        let touchPoint : CGPoint = touch.location(in: self.view!)
        
        let LoginFrame : CGRect = lblLogin.frame
        let AccountFrame : CGRect = lblAccount.frame
        
        if LoginFrame.contains(touchPoint) {
            performSegue(withIdentifier: "HomeSegueToLogin", sender: self)
        }
        
        if AccountFrame.contains(touchPoint){
            performSegue(withIdentifier : "HomeSegueToAccount", sender : self)
        }
 
    }
    @IBAction func unwindToHomeViewController(segue : UIStoryboardSegue)
    {
        
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
    
    }


}

