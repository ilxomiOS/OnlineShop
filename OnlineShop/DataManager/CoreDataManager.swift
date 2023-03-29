//
//  CoreDataManager.swift
//  OnlineShop
//
//  Created by Ilxom on 14/03/23.
//

import CoreData

final class CoreDataManager: CoreDataManagerProtocol {
	
	static let shared: CoreDataManager = {
		let container: NSPersistentContainer = {
			let container = NSPersistentContainer(name: "User")
			container.loadPersistentStores { (storeDescription, error) in
				if let error = error as NSError? {
					fatalError("Unresolved error \(error), \(error.userInfo)")
				}
			}
			return container
		}()
		return CoreDataManager(container: container)
	}()
	
	private let container: NSPersistentContainer
	
	var context: NSManagedObjectContext
	var viewContext: NSManagedObjectContext {
		Thread.isMainThread ? container.viewContext : context
	}
	
	private init(container: NSPersistentContainer) {
		self.container = container
		context = container.newBackgroundContext()
		context.mergePolicy = NSOverwriteMergePolicy
	}
	
	func save() throws {
		try context.save()
	}
	
	func fetchAll<T: NSManagedObject>() -> [T]? {
		do {
			let request: NSFetchRequest<T> = NSFetchRequest(entityName: String(describing: T.self))
			return try viewContext.fetch(request)
		} catch {
			print("Fetching failed: \(error.localizedDescription)")
			return []
		}
	}
	
}
