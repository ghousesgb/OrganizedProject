//
//  ViewController.swift
//  OrganizedProject
//
//  Created by Ghouse Basha Shaik on 30/01/18.
//  Copyright © 2018 Ghouse Basha Shaik. All rights reserved.
//

import UIKit

class PoliciesViewController: UIViewController {
    
    @IBOutlet weak var policiesTableView: UITableView!
    let policyNetworking = PoliciesNetworking()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        policyNetworking.getPolicies {[unowned self] in
            if self.policyNetworking.isValidResponse {
                self.policiesTableView.reloadData()
            }else {
                self.showAlertOnAPIError()
            }
        }
    }
}

extension PoliciesViewController {
    func showAlertOnAPIError() {
        let alertBox = AlertBox()
        alertBox.title = "Problem"
        alertBox.message = self.policyNetworking.message!
        alertBox.buttonOneTitle = "Ok"
        let alert = alertBox.showAlert(alertBox: alertBox, buttonOneHandler: { (action) in
            print("button ok clicked")
        })
        self.present(alert, animated:true, completion: nil)
        print(self.policyNetworking.message!)
    }
}

extension PoliciesViewController : UITableViewDataSource {
    
    func setupTableView() {
        policiesTableView.tableFooterView = UIView()
        policiesTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return policyNetworking.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "policyCell", for: indexPath) as? PoliciesTableViewCell
        cell?.polilcyObj = policyNetworking.cellForRowAt(indexPath: indexPath)
        return cell!
    }
}
