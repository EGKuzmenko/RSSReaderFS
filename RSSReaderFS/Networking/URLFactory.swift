//
//  URLFactory.swift
//  RSSReaderFS
//
//  Created by Георгий Кузьменко on 05/12/2019.
//  Copyright © 2019 Georgy Kuzmenko. All rights reserved.
//

import Foundation

private let API_KEY = "e1853145e03e45e2a92366970382ada1"

enum SortDescriptor: String {
    case popularity
}

class URLBuilder {
    
    func getArticlesURL(query: String, sortDescriptor: SortDescriptor) -> URL? {
        return URL(string: "https://newsapi.org/v2/everything?q=\(query)&from=2019-12-11&to=2019-12-11&sortBy=\(sortDescriptor.rawValue)&apiKey=\(API_KEY)".encodeURL)
        }
}
