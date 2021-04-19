//
//  AccountViewController.swift
//  TeeSafari_V1
//
//  Created by  on 4/18/21.
// Author Jeel Patel
// Student ID : 991548626
//

import UIKit

class AccountViewController: UIViewController {
    
    @IBOutlet weak var name : UITextField!
    @IBOutlet weak var email : UITextField!
    @IBOutlet weak var uname : UITextField!
    @IBOutlet weak var uPass : UITextField!
    
    
    @IBAction func addPerson(sender : Any){
        let person : Data = Data.init()
        person.initWithData(theRow: 0, theName: name.text!, theEmail: email.text!, theusername: uname.text!, theupass: uPass.text!)
        
        let mainDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let returnCode = mainDelegate.insertIntoDatabase(person: person)
        
        var returnMSG  : String = " Person Added"
        
        if returnCode == false {
            returnMSG = "Person add failed"
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        name.delegate=self
        email.delegate=self
        uname.delegate=self
        uPass.delegate=self

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
// this is for return key in keyboard

extension AccountViewController : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField:UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
