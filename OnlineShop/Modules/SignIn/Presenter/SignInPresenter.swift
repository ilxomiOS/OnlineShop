//
//  SignInPresenter.swift
//  OnlineShop
//
//  Created by Ilxom on 10/03/23.
//

import Foundation

final class SignInPresenter {
	
	private let interactor: SignInInteractorInput
	private let router: SignInRouterInput
	weak var view: SignInPresenterOutput?
	
	init(interactor: SignInInteractorInput, router: SignInRouterInput) {
		self.interactor = interactor
		self.router = router
	}
	
}

extension SignInPresenter: SignInPresenterInput  {
	
	func signIn(firstName: String?, lastName: String?, email: String?) {
		interactor.signIn(firstName: firstName, lastName: lastName, email: email)
	}
	
	func showLoginScreen() {
		router.navigate(to: .logIn)
	}
	
}

extension SignInPresenter: SignInInteractorOutput {
	
	func didSignInCompleted() {
		router.navigate(to: .home)
	}
	
	func onError(message: String) {
		router.showAlert(with: message)
	}
	
}
