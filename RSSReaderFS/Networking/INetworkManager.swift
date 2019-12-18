//
//  INetworkManager.swift
//  RSSReaderFS
//
//  Created by Георгий Кузьменко on 06/12/2019.
//  Copyright © 2019 Georgy Kuzmenko. All rights reserved.
//

import Foundation

protocol INetworkManager: AnyObject {
    func loadData(params: ArticlesParams, completion: @escaping ([Article]) -> Void)
    func loadImage(url: URL, completion: @escaping (Data) -> Void)
}
