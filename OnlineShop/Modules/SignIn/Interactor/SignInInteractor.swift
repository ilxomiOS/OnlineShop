//
//  SignInInteractor.swift
//  OnlineShop
//
//  Created by Ilxom on 10/03/23.
//

import Foundation

final class SignInInteractor {
	
	private let userService: UserServicesProtocol
	weak var presenter: SignInInteractorOutput?
	
	init(userService: UserServices) {
		self.userService = userService
	}
	
	private func validUserCredential(firstName: String, lastName: String, email: String) throws {
		let isValidFirstName = isValidName(firstName)
		let isValidLastName = isValidName(lastName)
		let isValidEmail = isValidEmail(email)
		
		if !isValidFirstName { throw AuthError.emptyFirstName }
		if !isValidLastName { throw AuthError.emptyLastName }
		if !isValidEmail { throw AuthError.invalidEmail }
	}
	
	private func isValidName(_ name: String) -> Bool {
		name.isEmpty ? false : true
	}
	
	private func isValidEmail(_ email: String) -> Bool {
		let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
		let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
		return emailPred.evaluate(with: email)
	}
	
}

extension SignInInteractor: SignInInteractorInput {
	
	func signIn(firstName: String?, lastName: String?, email: String?) {
		guard
			let firstName = firstName,
			let lastName = lastName,
			let email = email
		else { return }
		
		do {
			try validUserCredential(firstName: firstName, lastName: lastName, email: email)
			
			if let _ = try userService.fetchUser()?.first(where: { $0.email == email }) {
				presenter?.onError(message: AuthError.userAlreadyExist.localizedDescription)
				return
			}
			
			let userEntity = UserEntity(firstName: firstName, lastName: lastName, email: email)
			let user = try userService.saveUser(userEntity: userEntity)
			userService.setLoggedInUser(user)
			
			presenter?.didSignInCompleted()
		} catch {
			presenter?.onError(message: error.localizedDescription)
		}
	}
	
}
