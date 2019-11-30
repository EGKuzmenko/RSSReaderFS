//
//  RSSDateFormater.swift
//  RSSReaderFS
//
//  Created by Георгий Кузьменко on 30/11/2019.
//  Copyright © 2019 Georgy Kuzmenko. All rights reserved.
//

import Foundation

struct RSSDateFormater {
    static let dateFormater = DateFormatter()
    
    static func string(from date: Date) -> String {
        dateFormater.dateFormat = "dd.MM.yyyy"
        return dateFormater.string(from: date)
    }
}
