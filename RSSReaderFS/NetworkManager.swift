//
//  NetworkManager.swift
//  RSSReaderFS
//
//  Created by Георгий Кузьменко on 30/11/2019.
//  Copyright © 2019 Georgy Kuzmenko. All rights reserved.
//

import Foundation

class NetworkManager {
    private let session: URLSession = URLSession.shared
    
    func loadData(completion: @escaping ([Article]) -> Void) {
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=science&apiKey=37826ad6a0404352b3f3181d2d584aa9") else {
            return
        }
        
        let task = session.dataTask(with: url) { (data, response, error) in
            
            let decoder = JSONDecoder()
            let news = try! decoder.decode(News.self, from: data!)
            
            completion(news.articles)
        }
        
        task.resume()
    }
}

