//
//  HomeAssembly.swift
//  OnlineShop
//
//  Created by Ilxom on 16/03/23.
//

import UIKit

enum HomeAssembly {
	
	static func createView() -> UIViewController {
		let router = HomeRouter()
		let interactor = HomeInteractor()
		let presenter = HomePresenter(interactor: interactor, router: router)
		let view = HomeViewController(presenter: presenter)
		
		interactor.presenter = presenter
		presenter.view = view
		router.view = view
		
		return view
	}
	
}