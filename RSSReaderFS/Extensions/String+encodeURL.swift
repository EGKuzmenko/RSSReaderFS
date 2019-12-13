//
//  String+encodeURL.swift
//  RSSReaderFS
//
//  Created by Георгий Кузьменко on 12/12/2019.
//  Copyright © 2019 Georgy Kuzmenko. All rights reserved.
//

import Foundation

extension String {
    var encodeURL: String {
        return self.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
    }
    
    var decodeUrl : String {
        return self.removingPercentEncoding!
    }
}
