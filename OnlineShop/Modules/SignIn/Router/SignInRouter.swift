//
//  SignInRouter.swift
//  OnlineShop
//
//  Created by Ilxom on 10/03/23.
//

import UIKit

enum SignInNavigationItem {
	case home
	case logIn
}

final class SignInRouter {
	
	weak var view: UIViewController?
	
}

extension SignInRouter: SignInRouterInput {
	
	func showAlert(with message: String) {
		Alert.showAlert(message: message, viewController: view)
	}
	
	func navigate(to item: SignInNavigationItem) {
		switch item {
		case .home:
			let tabBar = TabBar()
			tabBar.modalPresentationStyle = .fullScreen
			view?.present(tabBar, animated: true)
		case .logIn:
			let logInVC = LogInAssembly.createView()
			view?.navigationController?.pushViewController(logInVC, animated: true)
		}
	}
	
}
