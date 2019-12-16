//
//  NetworkManager.swift
//  RSSReaderFS
//
//  Created by Георгий Кузьменко on 30/11/2019.
//  Copyright © 2019 Georgy Kuzmenko. All rights reserved.
//

import Foundation
import class UIKit.UIImage

class NetworkManager: INetworkManager {
    private let urlBuilder = URLBuilder()
    
    private let session: URLSession = URLSession.shared
    
    func loadData(completion: @escaping ([Article]) -> Void) {
        guard let url = urlBuilder.getArticlesURL(query: "Новый год", sortDescriptor: .popularity) else {
            return
        }
        
        let task = session.dataTask(with: url) { (data, response, error) in
            
            let decoder = JSONDecoder()
            
            guard let data = data else {
                return
            }
            let news = try! decoder.decode(News.self, from: data)
            
            completion(news.articles)
        }
        
        task.resume()
    }
    
    func loadImage(url: URL, completion: @escaping (Data) -> Void) {
        
        let task = session.downloadTask(with: url) { (url, response, error) in
            
            guard let url = url else {
                return
            }
            
            let imageData = try! Data(contentsOf: url)
            completion(imageData)
        }
        
        task.resume()
        }
}

