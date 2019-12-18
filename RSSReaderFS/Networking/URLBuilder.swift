//
//  URLFactory.swift
//  RSSReaderFS
//
//  Created by Георгий Кузьменко on 05/12/2019.
//  Copyright © 2019 Georgy Kuzmenko. All rights reserved.
//

import Foundation

private let API_KEY = "e1853145e03e45e2a92366970382ada1"

final class URLBuilder {
    let today = RSSDateFormater.urlDate(from: Date())
    let yesterday = RSSDateFormater.urlDate(from: Date().dayBefore)
    func getArticlesURL(params: ArticlesParams) -> URL? {
        if let keyWord = params.search {
            return URL(string: "https://newsapi.org/v2/everything?q=\(keyWord)&from=\(yesterday)&to=\(today)&sortBy=\(params.theme)&apiKey=\(API_KEY)".encodeURL)
        } else {
            return URL(string: "https://newsapi.org/v2/top-headlines?country=ru&apiKey=e1853145e03e45e2a92366970382ada1".encodeURL)
        }
    }
    
    
}
