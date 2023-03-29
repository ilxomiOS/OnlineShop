//
//  LoginRouter.swift
//  OnlineShop
//
//  Created by Ilxom on 16/03/23.
//

import UIKit

enum LogInNavigationItem {
	case home
}

final class LoginRouter {
	
	weak var view: UIViewController?
	
}

extension LoginRouter: LoginRouterInput {
	
	func showAlert(with message: String) {
		Alert.showAlert(message: message, viewController: view)
	}
	
	func navigate(to item: LogInNavigationItem) {
		switch item {
		case .home:
			let tabBar = TabBar()
			tabBar.modalPresentationStyle = .fullScreen
			view?.present(tabBar, animated: true)
		}
	}
	
}
