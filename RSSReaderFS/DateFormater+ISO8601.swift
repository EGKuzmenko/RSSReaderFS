//
//  DateFormater+ISO8601.swift
//  RSSReaderFS
//
//  Created by Георгий Кузьменко on 30/11/2019.
//  Copyright © 2019 Georgy Kuzmenko. All rights reserved.
//

import Foundation

extension DateFormatter {
  static let iso8601Full: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
    formatter.calendar = Calendar(identifier: .iso8601)
    formatter.timeZone = TimeZone(secondsFromGMT: 0)
    formatter.locale = Locale(identifier: "en_US_POSIX")
    return formatter
  }()
}
