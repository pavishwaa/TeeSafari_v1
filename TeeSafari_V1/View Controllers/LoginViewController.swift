//
//  LoginViewController.swift
//  TeeSafari_V1
//
//  Created by  on 4/18/21.
// Author Jeel Patel
// Student ID : 991548626
//

import UIKit

    class LoginViewController: UIViewController
    {
        
        @IBOutlet weak  var Uname : UITextField!
        @IBOutlet weak var UPass : UITextField!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Uname.delegate=self
        UPass.delegate=self
        // Do any additional setup after loading the view.
    }
    
        
        // TODO check whether the crendentials are correct if correct send it to main page if in correct display alert box

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    

}
extension LoginViewController : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField:UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
