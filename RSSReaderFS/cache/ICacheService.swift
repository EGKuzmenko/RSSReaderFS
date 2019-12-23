//
//  ICacheService.swift
//  RSSReaderFS
//
//  Created by Георгий Кузьменко on 23/12/2019.
//  Copyright © 2019 Georgy Kuzmenko. All rights reserved.
//

import Foundation

protocol ICacheService: AnyObject {
    func cache(article: Article)
    func retrive() -> [Article]
}
