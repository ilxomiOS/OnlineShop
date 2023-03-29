//
//  SignInAssembly.swift
//  OnlineShop
//
//  Created by Ilxom on 13/03/23.
//

import UIKit

enum SignInAssembly {
	
	static func createView() -> UIViewController {
		
		let dataManager = CoreDataManager.shared
		let userService = UserServices(dataManager: dataManager)
		
		let router = SignInRouter()
		let interactor = SignInInteractor(userService: userService)
		let presenter = SignInPresenter(interactor: interactor, router: router)
		let view = SignInViewController(presenter: presenter)
		let navigationController = UINavigationController(rootViewController: view)
		
		interactor.presenter = presenter
		presenter.view = view
		router.view = view
		
		return navigationController
	}
	
}
