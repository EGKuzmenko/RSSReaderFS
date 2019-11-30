//
//  IFeedView.swift
//  RSSReaderFS
//
//  Created by Георгий Кузьменко on 28/11/2019.
//  Copyright © 2019 Georgy Kuzmenko. All rights reserved.
//

import Foundation

protocol IFeedView: AnyObject {
    func setupInitialState()
    func updateView()
}
