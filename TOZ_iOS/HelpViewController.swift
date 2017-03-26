//
//  HelpViewController.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

class HelpViewController: UIViewController {

    @IBOutlet weak var organizationLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        getOrganizationInfo()
    }

    func getOrganizationInfo() {
        let organizationInfo = OrganizationInfoOperation()
        organizationInfo.start()
        // item is of type OrganizationInfoItem
        switch organizationInfo.result {
        case .success:
            organizationInfo.result.success = { item in
                DispatchQueue.main.async {
                self.organizationLabel.text = "Organization: \(item.name) \n Bank Account Number: \(item.bankAccountNumber) \n Bank name: \(item.bankAccountBankName)"
                }
            }
        default:
            organizationInfo.result.failure = { error in print(error.localizedDescription) }
        }
    }
}
