//
//  LoginViewController.swift
//  RSSReaderFS
//
//  Created by Георгий Кузьменко on 07/12/2019.
//  Copyright © 2019 Georgy Kuzmenko. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    private lazy var presenter: ILoginPresneter = {
        return LoginPresenter(view: self)
    }()

    @IBOutlet weak var loginTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onSigninButtonTap(_ sender: UIButton) {
        
    }
    
    @IBAction func onSignupButtonTap(_ sender: UIButton) {
        
    }
}

extension LoginViewController: ILoginView {
    func setupInitialState() {
        
    }
}
