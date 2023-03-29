//
//  LogInAssembly.swift
//  OnlineShop
//
//  Created by Ilxom on 16/03/23.
//

import UIKit

enum LogInAssembly {
	
	static func createView() -> UIViewController {
		let dataManager = CoreDataManager.shared
		let userService = UserServices(dataManager: dataManager)
		
		let router = LoginRouter()
		let interactor = LogInInteractor(userService: userService)
		let presenter = LogInPresenter(interactor: interactor, router: router)
		let view = LogInViewController(presenterter: presenter)
		
		interactor.presenter = presenter
		presenter.view = view
		router.view = view
		
		return view
	}
	
}
