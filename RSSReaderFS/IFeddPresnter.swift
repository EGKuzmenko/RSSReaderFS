//
//  IFeddPresnter.swift
//  RSSReaderFS
//
//  Created by Георгий Кузьменко on 28/11/2019.
//  Copyright © 2019 Georgy Kuzmenko. All rights reserved.
//

import Foundation

protocol IFeddPresnter: AnyObject {
    func onViewReadyevent()
    func numberOfRowsInSection(section: Int) -> Int
    func itemForRowIndexPath(indexPath: IndexPath) -> Data 
}
