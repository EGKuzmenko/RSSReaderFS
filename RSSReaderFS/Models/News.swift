//
//  Article.swift
//  RSSReaderFS
//
//  Created by Георгий Кузьменко on 30/11/2019.
//  Copyright © 2019 Georgy Kuzmenko. All rights reserved.
//

import Foundation

struct News: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let source: Source
    let author: String?
    let title: String
    let articleDescription: String?
    let url: String
    let urlToImage: String?
    let publishedAt: Date
//    let content: String?

    enum CodingKeys: String, CodingKey {
        case source, author, title
        case articleDescription = "description"
        case url, urlToImage, publishedAt, content
    }
    

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        source = try container.decode(Source.self, forKey: .source)
        author = try? container.decode(String.self, forKey: .author)
        title = try container.decode(String.self, forKey: .title)
        articleDescription = try? container.decode(String.self, forKey: .articleDescription)
        url = try container.decode(String.self, forKey: .url)
        urlToImage = try? container.decode(String.self, forKey: .urlToImage)

        let dateString = try container.decode(String.self, forKey: .publishedAt)
        let formatter = DateFormatter.iso8601Full
          if let date = formatter.date(from: dateString) {
              publishedAt = date
          } else {
              throw DecodingError.dataCorruptedError(forKey: .publishedAt,
                    in: container,
                    debugDescription: "Date string does not match format expected by formatter.")
          }
    }
    
    init(managedArtice: ArticleMO) {
        source = Source(id: "", name: "")
        author = nil
        title = managedArtice.title ?? ""
        articleDescription = managedArtice.articleDescription
        url = managedArtice.url ?? ""
        urlToImage = managedArtice.urlToImage
        publishedAt = managedArtice.date!
    }
}

struct Source: Decodable {
    let id: String?
    let name: String
}
