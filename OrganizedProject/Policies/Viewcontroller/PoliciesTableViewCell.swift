//
//  PoliciesTableViewCell.swift
//  OrganizedProject
//
//  Created by Ghouse Basha Shaik on 01/02/18.
//  Copyright © 2018 Ghouse Basha Shaik. All rights reserved.
//

import UIKit

class PoliciesTableViewCell: UITableViewCell {

    @IBOutlet weak var policyNoLabel: UILabel!
    @IBOutlet weak var nameEnsuredLabel: UILabel!
    @IBOutlet weak var pryAddressLabel: UILabel!
    @IBOutlet weak var agencyNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var polilcyObj:PolicyInfo? {
        didSet {
            configureCell()
        }
    }
    
    func configureCell() {
        if let policyNo = polilcyObj?.policyno  {
            policyNoLabel.text = policyNo
        }
        
        if let nameEnsure = polilcyObj?.nameensured {
            nameEnsuredLabel.text = nameEnsure
        }
        
        if let pryAddress = polilcyObj?.pryaddress {
            pryAddressLabel.text = pryAddress
        }
        
        if let agencyName = polilcyObj?.agencyname {
            agencyNameLabel.text = agencyName
        }
    }
    
}
