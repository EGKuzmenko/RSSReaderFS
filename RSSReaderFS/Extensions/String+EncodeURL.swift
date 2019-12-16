//
//  String+EncodeURL.swift
//  RSSReaderFS
//
//  Created by Георгий Кузьменко on 16/12/2019.
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
