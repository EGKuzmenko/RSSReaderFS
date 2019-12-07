//
//  LoginPresenter.swift
//  RSSReaderFS
//
//  Created by Георгий Кузьменко on 07/12/2019.
//  Copyright © 2019 Georgy Kuzmenko. All rights reserved.
//

import Foundation

class LoginPresenter: ILoginPresneter {
    
    private weak var view :ILoginView?
    
    init(view: ILoginView?) {
        self.view = view
    }
    
    func onViewReadyEvent() {
        view?.setupInitialState()
    }
    
    func onSigninButtonTapEvent(userLogin: String?, userPassword: String?) {
        
    }
    
    func onSignupButtonTapEvent() {
        
    }
    
}
