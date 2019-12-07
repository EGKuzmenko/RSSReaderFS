//
//  UserMO+CoreDataProperties.swift
//  RSSReaderFS
//
//  Created by Георгий Кузьменко on 07/12/2019.
//  Copyright © 2019 Georgy Kuzmenko. All rights reserved.
//
//

import Foundation
import CoreData


extension UserMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserMO> {
        return NSFetchRequest<UserMO>(entityName: "User")
    }

    @NSManaged public var login: String?
    @NSManaged public var password: String?
    @NSManaged public var articles: NSSet?

}

// MARK: Generated accessors for articles
extension UserMO {

    @objc(addArticlesObject:)
    @NSManaged public func addToArticles(_ value: ArticleMO)

    @objc(removeArticlesObject:)
    @NSManaged public func removeFromArticles(_ value: ArticleMO)

    @objc(addArticles:)
    @NSManaged public func addToArticles(_ values: NSSet)

    @objc(removeArticles:)
    @NSManaged public func removeFromArticles(_ values: NSSet)

}
