//
//  Date+yesterdayDay.swift
//  RSSReaderFS
//
//  Created by Георгий Кузьменко on 19/12/2019.
//  Copyright © 2019 Georgy Kuzmenko. All rights reserved.
//

import Foundation

extension Date {
    static var yesterday: Date {
        return Date().dayBefore
    }
    
    var dayBefore: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: noon)!
    }
    var noon: Date {
        return Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self)!
    }
}
