//
//  FavoritePresenter.swift
//  RSSReaderFS
//
//  Created by Георгий Кузьменко on 16/12/2019.
//  Copyright © 2019 Georgy Kuzmenko. All rights reserved.
//

import Foundation
import SafariServices


class FavoritePresenter {
    private let cacheService = CacheService()
    
    private weak var view: IFavoriteView?
    
    private var items: [Article] = []
    
    private let networkManager = NetworkManager()
    
    init(view: IFavoriteView?) {
        self.view = view
    }
    
}

extension FavoritePresenter: IFavoritePresenter {
    func numberOfRowsInSection(section: Int) -> Int {
        return items.count
    }
    
    func itemForRowIndexPath(indexPath: IndexPath, imageResult: @escaping (Data?) -> Void) -> Article {
        let item = items[indexPath.row]
        if let string = item.urlToImage, let url = URL(string: string) {
            self.networkManager.loadImage(url: url, completion: imageResult)
        } else {
            imageResult(nil)
        }
        
        return item
    }
    
    func linkToSafari(url: String) {
        guard let url = URL(string: url) else {
            return
        }
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    func onViewReadyEvent() {
        view?.setupInitialState()
        getItems()
    }
    
    func getItems() {
        self.items = cacheService.retrive()
    }
    
    func updateEvent() {
        self.getItems()
        view?.updateView()
        view?.endRefreshing()
    }
}
