//
//  FeedPresenter.swift
//  RSSReaderFS
//
//  Created by Георгий Кузьменко on 28/11/2019.
//  Copyright © 2019 Georgy Kuzmenko. All rights reserved.
//

import Foundation

class FeedPresenter: IFeddPresnter {
    
    private weak var view: IFeedView?
    private var items: [Data] = []
    
    init(view: IFeedView) {
        self.view = view
    }
    
    func onViewReadyevent() {
        view?.setupInitialState()
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        return items.count
    }
    
    func itemForRowIndexPath(indexPath: IndexPath) -> Data {
        return items[indexPath.row]
    }
}
