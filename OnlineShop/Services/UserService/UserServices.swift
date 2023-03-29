//
//  UserServices.swift
//  OnlineShop
//
//  Created by Ilxom on 14/03/23.
//

import Foundation

final class UserServices: UserServicesProtocol {
	
	private let dataManager: CoreDataManagerProtocol
	
	init(dataManager: CoreDataManager) {
		self.dataManager = dataManager
	}
	
	func saveUser(userEntity: UserEntity) throws {
		let user = User(context: dataManager.context)
		user.firstName = userEntity.firstName
		user.lastName = userEntity.lastName
		user.email = userEntity.email
		
		do {
			try dataManager.save()
		} catch {
			throw AuthError.errorSavingNewUser
		}
	}
	
	func fetchUser() throws -> [User]? {
		return dataManager.fetchAll()
	}
	
}
