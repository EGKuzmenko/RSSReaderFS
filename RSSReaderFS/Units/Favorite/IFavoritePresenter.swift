//
//  IFavoritePresenter.swift
//  RSSReaderFS
//
//  Created by Георгий Кузьменко on 16/12/2019.
//  Copyright © 2019 Georgy Kuzmenko. All rights reserved.
//

import Foundation

protocol IFavoritePresenter: AnyObject {
    func onViewReadyEvent()
    func numberOfRowsInSection(section: Int) -> Int
    func itemForRowIndexPath(indexPath: IndexPath, imageResult: @escaping (Data?)->Void) -> Article
    func linkToSafari(url: String)
    func getItems()
    func updateEvent()

}
