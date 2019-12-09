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
        presenter.onSigninButtonTapEvent(userLogin: loginTextField.text, userPassword: passwordTextField.text)
    }
    
    @IBAction func onSignupButtonTap(_ sender: UIButton) {
        presenter.onSignupButtonTapEvent(userLogin: loginTextField.text, userPassword: passwordTextField.text)
    }
}

extension LoginViewController: ILoginView {
    func setupInitialState() {
        
    }
    
    func showWrongAlert() {
        let alert = UIAlertController(title: "Alert", message: "This user is not registered", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel))
        self.present(alert, animated: true)
    }
    
    func showMainStoryboard() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "FeedViewController") as! FeedViewController
        guard let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return
        }
        let navigation = UINavigationController(rootViewController: vc)
        scene.windows.first?.rootViewController = navigation
        
    }
}
