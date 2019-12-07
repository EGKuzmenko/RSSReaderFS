//
//  CacheService.swift
//  RSSReaderFS
//
//  Created by Георгий Кузьменко on 07/12/2019.
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
    
    func cacheUser(user: User) {
        let context = self.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "User", in: context)
        let mangedObject = NSManagedObject(entity: entity!, insertInto: context)
        
        let managedUser = mangedObject as! UserMO
        managedUser.fill(user)
        
        save()
    }
    
    func search(login: String, password: String) -> User? {
        let context = self.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        fetchRequest.predicate = NSPredicate(format: "login = %@ AND password = %@", login, password)
        
        do {
            guard let results = try context.fetch(fetchRequest) as? [UserMO], let user = results.first else {
                assertionFailure("Can't cast to UserMO.")
                return nil
            }
            return User(user)
        } catch {
            assertionFailure("Can't obtain user from Database")
            return nil
        }
    }
}
