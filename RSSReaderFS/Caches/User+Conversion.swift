//
//  User+Conversion.swift
//  RSSReaderFS
//
//  Created by Георгий Кузьменко on 07/12/2019.
//  Copyright © 2019 Georgy Kuzmenko. All rights reserved.
//

import CoreData



extension UserMO {
    func fill(_ user: User) {
        self.login = user.login
        self.password = user.password
    }
}


extension User {
    init(_ user: UserMO) {
        self.login = user.login!
        self.password = user.password!
    }
}
