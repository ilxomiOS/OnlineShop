//
//  LogInInteractor.swift
//  OnlineShop
//
//  Created by Ilxom on 16/03/23.
//

import Foundation

final class LogInInteractor {
	
	private let userService: UserServicesProtocol
	weak var presenter: LogInInteractorOutput?
	
	init(userService: UserServices) {
		self.userService = userService
	}
	
	private func validUserCredential(firstName: String, password: String) throws {
		let isValidFirstName = isValidName(firstName)
		let isValidPassword = isValidPassword(password)
		
		if !isValidFirstName { throw AuthError.emptyFirstName }
		if !isValidPassword { throw AuthError.invalidPassword }
	}
	
	private func isValidName(_ name: String) -> Bool {
		name.isEmpty ? false : true
	}
	
	private func isValidPassword(_ password: String) -> Bool {
		if password.count < 6 {
			return false
		}
		
		return true
	}
	
}

extension LogInInteractor: LogInInteractorInput {
	
	func logIn(firstName: String?, password: String?) {
		guard
			let firstName = firstName,
			let password = password
		else { return }
		
		do {
			try validUserCredential(firstName: firstName, password: password)
			
			if let _ = try userService.fetchUser()?.first(where: { $0.firstName == firstName }) {
				presenter?.didLogInCompleted()
			} else {
				presenter?.onError(message: AuthError.userDoesntExist.localizedDescription)
			}
			
		} catch {
			presenter?.onError(message: error.localizedDescription)
		}
		
	}
	
}
