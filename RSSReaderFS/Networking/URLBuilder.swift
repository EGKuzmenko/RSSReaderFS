//
//  URLFactory.swift
//  RSSReaderFS
//
//  Created by Георгий Кузьменко on 05/12/2019.
//  Copyright © 2019 Georgy Kuzmenko. All rights reserved.
//

import Foundation

final class URLBuilder {
    
    private let API_KEY = "e1853145e03e45e2a92366970382ada1"
    
    let today = RSSDateFormater.urlDate(from: Date())
    let yesterday = RSSDateFormater.urlDate(from: Date().dayBefore)
    
    
    func getArticlesURL(params: ArticlesParams) -> URL? {
        var urlComponents = URLComponents()
        
        urlComponents.scheme = "https"
        urlComponents.host = "newsapi.org"
        urlComponents.path = "/v2/everything"
        urlComponents.queryItems = [
            URLQueryItem(name: "from", value: yesterday),
            URLQueryItem(name: "to", value: today),
            URLQueryItem(name: "sortBy", value: params.theme),
            URLQueryItem(name: "apiKey", value: API_KEY)
        ]
        
        if let keyword = params.search {
            let keywordQueryItem = URLQueryItem(name: "q", value: keyword)
            urlComponents.queryItems?.append(keywordQueryItem)
            return urlComponents.url
        } else {
            return defaultURL()
        }
    }
}

private extension URLBuilder {
    
    private func defaultURL() -> URL? {
        var urlComponents = URLComponents()
        
        urlComponents.scheme = "https"
        urlComponents.host = "newsapi.org"
        urlComponents.path = "/v2/top-headlines"
        urlComponents.queryItems = [
            URLQueryItem(name: "country", value: "ru"),
            URLQueryItem(name: "category", value: "business"),
            URLQueryItem(name: "apiKey", value: API_KEY)
        ]
        return urlComponents.url
    }
}
