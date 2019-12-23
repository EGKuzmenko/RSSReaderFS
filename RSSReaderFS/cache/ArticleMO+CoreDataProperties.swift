//
//  ArticleMO+CoreDataProperties.swift
//  RSSReaderFS
//
//  Created by Георгий Кузьменко on 23/12/2019.
//  Copyright © 2019 Georgy Kuzmenko. All rights reserved.
//
//

import Foundation
import CoreData


extension ArticleMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ArticleMO> {
        return NSFetchRequest<ArticleMO>(entityName: "Article")
    }

    @NSManaged public var title: String?
    @NSManaged public var articleDescription: String?
    @NSManaged public var urlToImage: String?
    @NSManaged public var date: Date?
    @NSManaged public var url: String?

}
