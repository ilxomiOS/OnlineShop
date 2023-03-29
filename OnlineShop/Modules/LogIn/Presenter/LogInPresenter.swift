//
//  LogInPresenter.swift
//  OnlineShop
//
//  Created by Ilxom on 16/03/23.
//

import Foundation

final class LogInPresenter {
	
	private let interactor: LogInInteractorInput
	private let router: LoginRouterInput
	weak var view: LogInPresenterOutput?
	
	init(interactor: LogInInteractorInput, router: LoginRouterInput) {
		self.interactor = interactor
		self.router = router
	}
	
}

extension LogInPresenter: LogInPresenterInput {
	func logIn(firstName: String?, password: String?) {
		interactor.logIn(firstName: firstName, password: password)
	}
}

extension LogInPresenter: LogInInteractorOutput {
	func didLogInCompleted() {
		router.navigate(to: .home)
	}
	
	func onError(message: String) {
		router.showAlert(with: message)
	}
	
	
}
