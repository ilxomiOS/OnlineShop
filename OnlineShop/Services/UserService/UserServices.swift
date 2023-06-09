//
//  UserServices.swift
//  OnlineShop
//
//  Created by Ilxom on 14/03/23.
//

import Foundation

final class UserServices: UserServicesProtocol {
	
	var userLoggedIn: User?
	
	private let dataManager: CoreDataManagerProtocol
	
	init(dataManager: CoreDataManager) {
		self.dataManager = dataManager
	}
	
	func setLoggedInUser(_ user: User) {
		userLoggedIn = user
	}
	
	func saveUser(userEntity: UserEntity) throws -> User {
		let user = User(context: dataManager.context)
		user.firstName = userEntity.firstName
		user.lastName = userEntity.lastName
		user.email = userEntity.email
		
		do {
			try dataManager.save()
			return user
		} catch {
			throw AuthError.errorSavingNewUser
		}
	}
	
	func fetchUser() throws -> [User]? {
		return dataManager.fetchAll()
	}
	
}
