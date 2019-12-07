//
//  ILoginPresneter.swift
//  RSSReaderFS
//
//  Created by Георгий Кузьменко on 07/12/2019.
//  Copyright © 2019 Georgy Kuzmenko. All rights reserved.
//

import Foundation

protocol ILoginPresneter: AnyObject {
    func onViewReadyEvent()
    func onSigninButtonTapEvent(userLogin: String?, userPassword: String?)
    func onSignupButtonTapEvent(userLogin: String?, userPassword: String?)
}
