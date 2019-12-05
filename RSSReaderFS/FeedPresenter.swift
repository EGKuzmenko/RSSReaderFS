//
//  FeedPresenter.swift
//  RSSReaderFS
//
//  Created by Георгий Кузьменко on 28/11/2019.
//  Copyright © 2019 Georgy Kuzmenko. All rights reserved.
//

import Foundation
import UIKit

class FeedPresenter: IFeddPresnter {

    
    private weak var view: IFeedView?
    
    private var items: [Article] = []
    
    private var networkManager = NetworkManager()
    
    init(view: IFeedView) {
        self.view = view
    }
    
    func onViewReadyevent() {
        view?.setupInitialState()
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        return items.count
    }
    
    func itemForRowIndexPath(indexPath: IndexPath, imageResult: @escaping (UIImage?) -> Void) -> Article {
        let item = items[indexPath.row]
        if let string = item.urlToImage, let url = URL(string: string) {
            self.networkManager.loadImage(url: url, completion: imageResult)
        } else {
            imageResult(nil)
        }
        
        
        return item
    }
    
    func onUpdateBuutonTapEvent() {
        networkManager.loadData { [weak self] (articles) in
            self?.items = articles
            DispatchQueue.main.async {
                self?.view?.updateView()
            }
        }
    }
    
    
}
