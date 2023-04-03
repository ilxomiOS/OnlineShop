//
//  UserServicesProtocol.swift
//  OnlineShop
//
//  Created by Ilxom on 16/03/23.
//

import Foundation

protocol UserServicesProtocol {
	var userLoggedIn: User? { get set }
	func setLoggedInUser(_ user: User)
	func saveUser(userEntity: UserEntity) throws -> User
	func fetchUser() throws -> [User]?
}
