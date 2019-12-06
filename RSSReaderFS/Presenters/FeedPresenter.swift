//
//  FeedPresenter.swift
//  RSSReaderFS
//
//  Created by Георгий Кузьменко on 28/11/2019.
//  Copyright © 2019 Georgy Kuzmenko. All rights reserved.
//

import Foundation
import UIKit

class FeedPresenter: IFeedPresnter {

    
    private weak var view: IFeedView?
    
    private var items: [Article] = []
    private var imageDownloadTasks = [Int: URLSessionDownloadTask]()
    
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
    
    func itemForRowIndexPath(indexPath: IndexPath, imageResult: @escaping (UIImage?, IndexPath) -> Void) -> Article {
        let item = items[indexPath.row]
        if let string = item.urlToImage, let url = URL(string: string) {
           let task = self.networkManager.loadImage(url: url, completion: { image in
                imageResult(image, indexPath)
           })
            self.imageDownloadTasks[indexPath.row] = task
        } else {
            imageResult(nil, indexPath)
        }
        
        
        return item
    }
    
    func cancelImageDownload(indexPath: IndexPath) {
        let task = self.imageDownloadTasks[indexPath.row]
        task?.cancel()
        self.imageDownloadTasks[indexPath.row] = nil
    }
    
    func onUpdateBuutonTapEvent() {
        networkManager.loadData { [weak self] (articles) in
            self?.items = articles
            // TODO: clean map wiyh tasks
            DispatchQueue.main.async {
                self?.view?.updateView()
            }
        }
    }
    
    
}
