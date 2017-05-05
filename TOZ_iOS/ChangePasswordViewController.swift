//
//  ResetPasswordViewController.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

class ChangePasswordViewController: UIViewController {
    @IBOutlet weak var oldPassword: TextInputView!
    @IBOutlet weak var newPassword: TextInputView!
    @IBOutlet weak var confirmNewPassword: TextInputView!

    override func viewDidLoad() {
        super.viewDidLoad()

        oldPassword.textChecker = PasswordChecker()
        oldPassword.isTextSecure = true
        newPassword.textChecker = PasswordChecker()
        newPassword.isTextSecure = true

        let confirmationTextChecker = PasswordChecker()
        confirmationTextChecker.confirmView = self.newPassword

        confirmNewPassword.textChecker = confirmationTextChecker
        confirmNewPassword.isTextSecure = true

        self.view.backgroundColor = Color.Background.primary
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.view.reloadInputViews()
    }

    @IBAction func confirmButtonAction(_ sender: Any) {

//    private func isPasswordValid() -> Bool {
//        //to be continued when possible
//        //send request to BE for confirmation
//        return false
    }

}
