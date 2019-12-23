//
//  ImageDownloadManager.swift
//  RSSReaderFS
//
//  Created by Георгий Кузьменко on 23/12/2019.
//  Copyright © 2019 Georgy Kuzmenko. All rights reserved.
//

import Foundation
import UIKit

typealias ImageDownloadHandler = (_ image: UIImage?, _ url: URL, _ indexPath: IndexPath?, _ error: Error?) -> Void

final class ImageDownloadManager {
    private var completionHandler: ImageDownloadHandler?
    
    static let shared = ImageDownloadManager()
    
    private init() {}
}
