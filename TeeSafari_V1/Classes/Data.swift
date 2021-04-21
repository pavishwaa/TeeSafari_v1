//
//  Data.swift
//  TeeSafari_V1
//
//  Created by  on 4/19/21.
//

import UIKit

class Data: NSObject {
    var id : Int?
    var name : String?
    var email : String?
    var username : String?
    var upassword : String?
    
    func initWithData(theRow i : Int, theName n : String, theEmail e : String, theusername un : String, theupass up : String){
        
        id=i
        name=n
        email=e
        username=un
        upassword=up
    }
    
    func initWithData1(theusername un:String, theupass up:String){
        username=un
        upassword=up
    }

}
