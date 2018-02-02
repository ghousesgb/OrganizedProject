//
//  AlertBox.swift
//  OrganizedProject
//
//  Created by Ghouse Basha Shaik on 01/02/18.
//  Copyright © 2018 Ghouse Basha Shaik. All rights reserved.
//

import UIKit

class AlertBox {
    var title : String = ""
    var message : String = ""
    var buttonOneTitle: String = ""
    var buttonTwoTitle: String = ""
    var isSecondButtonAction = false
    
    func showAlert(alertBox : AlertBox, buttonOneHandler:((UIAlertAction) -> Void)?) -> UIAlertController {
     
        let alertController = UIAlertController(title:alertBox.title, message: alertBox.message, preferredStyle: .alert)
        
        let buttonOne = UIAlertAction(title: alertBox.buttonOneTitle, style: .default) {(action) in
               buttonOneHandler!(action)
        }
        
        if isSecondButtonAction {
            let buttonTwo =  UIAlertAction(title: alertBox.buttonTwoTitle, style: .default) {(action) in
                return
            }
            alertController.addAction(buttonTwo)
        }
        alertController.addAction(buttonOne)
        return alertController
    }
}


