//
//  ICacheService.swift
//  RSSReaderFS
//
//  Created by Георгий Кузьменко on 07/12/2019.
//  Copyright © 2019 Georgy Kuzmenko. All rights reserved.
//

import Foundation

protocol ICacheService: AnyObject {
    func cacheUser(user: User)
    func search(login: String, password: String) -> User?
}
