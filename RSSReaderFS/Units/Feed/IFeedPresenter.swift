//
//  IFeedPresnter.swift
//  RSSReaderFS
//
//  Created by Георгий Кузьменко on 28/11/2019.
//  Copyright © 2019 Georgy Kuzmenko. All rights reserved.
//

import Foundation
import class UIKit.UIImage

protocol IFeedPresenter: AnyObject {
    func onViewReadyevent()
    func numberOfRowsInSection(section: Int) -> Int
    func itemForRowIndexPath(indexPath: IndexPath, imageResult: @escaping (Data?)->Void) -> Article
    func updateEvent()
    func setSearch( _ :String)
    func linkToSafari(url: String)
    func getItem(indexPath: IndexPath) -> Article
    func saveToFavorite(article: Article)
}
