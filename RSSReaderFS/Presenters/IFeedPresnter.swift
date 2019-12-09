//
//  IFeedPresnter.swift
//  RSSReaderFS
//
//  Created by Георгий Кузьменко on 28/11/2019.
//  Copyright © 2019 Georgy Kuzmenko. All rights reserved.
//

import Foundation
import class UIKit.UIImage

protocol IFeedPresnter: AnyObject {
    func onViewReadyevent()
    func numberOfRowsInSection(section: Int) -> Int
    func itemForRowIndexPath(indexPath: IndexPath, imageResult: @escaping (UIImage?, IndexPath)->Void) -> Article
    func cancelImageDownload(indexPath: IndexPath) 
    func updateEvent()
}
