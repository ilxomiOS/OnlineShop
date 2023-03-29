//
//  CoreDataManagerProtocol.swift
//  OnlineShop
//
//  Created by Ilxom on 16/03/23.
//

import CoreData

protocol CoreDataManagerProtocol {
	var context: NSManagedObjectContext { get }
	var viewContext: NSManagedObjectContext { get }
	func save() throws
	func fetchAll<T: NSManagedObject>() -> [T]?
}
