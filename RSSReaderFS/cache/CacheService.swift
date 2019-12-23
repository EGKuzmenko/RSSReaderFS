//
//  CacheService.swift
//  RSSReaderFS
//
//  Created by Георгий Кузьменко on 23/12/2019.
//  Copyright © 2019 Georgy Kuzmenko. All rights reserved.
//

import CoreData

class CacheService {
    let persistentContainer: NSPersistentContainer
    
    init() {
        self.persistentContainer = NSPersistentContainer(name: "RSSReaderDataModel")
        self.persistentContainer.loadPersistentStores { (_, error) in
            if let error = error {
            fatalError("Can't load persistent stores. Error info \(error.localizedDescription)")
            }
        }
    }
    
    func save() {
        do {
            try self.persistentContainer.viewContext.save()
        } catch {
            assertionFailure("Can't save viewContext with error: \(error.localizedDescription)")
        }
    }
}

extension CacheService: ICacheService {
    func cache(article: Article) {
        let context = self.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Article", in: context)
        let managedObject = NSManagedObject(entity: entity!, insertInto: context)
        
        let managedArticle = managedObject as! ArticleMO
        
        managedArticle.title = article.title
        managedArticle.articleDescription = article.articleDescription
        managedArticle.url = article.url
        managedArticle.urlToImage = article.urlToImage
        managedArticle.date = article.publishedAt
        
        save()
    }
    
    func retrive() -> [Article] {
        let context = self.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Article")
        
        do {
            guard let results = try context.fetch(fetchRequest) as? [ArticleMO] else {
                assertionFailure("Can't cast to ArticleMO.")
                return[]
            }
            
            return results.map{Article(managedArtice: $0)}
        } catch {
            assertionFailure("Can't obtain person from Database")
            return[]
        }
        
    }
}
