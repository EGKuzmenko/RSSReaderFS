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
    
    private let cacheService: ICacheService = CacheService()
    
    private let defaults = UserDefaults.standard
    
    init(view: ILoginView?) {
        self.view = view
    }
    
    func onViewReadyEvent() {
        view?.setupInitialState()
    }
    
    func onSigninButtonTapEvent(userLogin: String?, userPassword: String?) {
        guard let userLogin = userLogin, let userPassword = userPassword else {
            return
        }
        
        if let user = cacheService.search(login: userLogin, password: userPassword) {
            view?.showMainStoryboard()
            defaults.set(true, forKey: "flag")
        } else {
            view?.showWrongAlert()
        }
    }
    
    func onSignupButtonTapEvent(userLogin: String?, userPassword: String?) {
        guard let userLogin = userLogin, let userPassword = userPassword else {
            return
        }
        
        let user = User(login: userLogin, password: userPassword)
        
        cacheService.cacheUser(user: user)
    }
    
}
