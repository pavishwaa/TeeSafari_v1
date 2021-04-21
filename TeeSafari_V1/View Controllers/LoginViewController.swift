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
        @IBOutlet var button : UIButton!
        
        var x=0;
        
        let mainDelegate = UIApplication.shared.delegate as! AppDelegate

        
          // This method will be used to check if users login crendentials are corrrect or not
       @IBAction  func loginCheck(_sender: UIButton)
        {
            let p = mainDelegate.people.count
        
            
        for x in 0..<(p){
                if(Uname.text == mainDelegate.people[x].username ){
                    
                    if (UPass.text ==  mainDelegate.people[x].upassword){
                        button.isEnabled=true
                    }
                    else{
                        
                        
                    }
                    
                }
                else{
                    
                }
        }
            
        }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        button.isEnabled=false
        
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
