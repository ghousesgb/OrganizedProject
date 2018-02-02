//
//  Utilities.swift
//  CodeQuality
//
//  Created by Ghouse Basha Shaik on 12/01/18.
//  Copyright © 2018 Ghouse Basha Shaik. All rights reserved.
//

import UIKit

class Utilities {
    //Function Validating any string value
    class func validate(text : String, maxLength: Int?) -> Bool {
        if text.count < 3 {
            return false
        }
        if let maxLength = maxLength, maxLength != 0 {
            if text.count > maxLength {
                return false
            }
        }
        return true
    }

    //Funciton to validate accept only numbers
    class func validateNumber(number : String, maxLength: Int) -> Bool {
        if number.count < 3 {
            return false
        }
        let numberRegEx = "[0-9]{\(maxLength)}"
        let numberTest = NSPredicate(format: "SELF MATCHES %@",numberRegEx)
        return numberTest.evaluate(with: number)
    }

    //Function to validate emails
    class func isValid(email:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: email)
        return result
    }

    //Function to validate valid password and must have aleast one small, caps, digit and spl
    class func isValid(password:String, maxLength: Int) -> Bool {
        let passwordRegEx = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%*?&]{\(maxLength),}"
        let passwordTest = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        return passwordTest.evaluate(with: password)
    }

    //Function to validate password and confirm password
    class func isBothPasswordSame(password: String , confirmPassword : String) -> Bool {
        if password == confirmPassword{
            return true
        }else{
            return false
        }
    }
    
    class func showAlert(withTitle: String?,okTitle: String?, cancelTitle: String?, message: String,isCancel:Bool, okHandler:((UIAlertAction) -> Void)?)  -> UIAlertController  {
        let alertController = UIAlertController(title: withTitle, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: okTitle, style: .default) { (action) in
            okHandler!(action)
        }
        if isCancel {
            let cancelAction = UIAlertAction(title: cancelTitle, style: .cancel) { (action) in
                return
            }
            alertController.addAction(cancelAction)
        }
        alertController.addAction(OKAction)
        return alertController
    }
    
    class func showAlertOnlyOk(withTitle: String?, okTitle: String?, message: String, inViewController: UIViewController) {
        let alertController = UIAlertController(title: withTitle, message: message, preferredStyle: .alert)
        let oKAction = UIAlertAction(title: okTitle, style: .default)
        alertController.addAction(oKAction)
        DispatchQueue.main.async {
            inViewController.present(alertController, animated: true, completion: nil)
        }
    }
}
