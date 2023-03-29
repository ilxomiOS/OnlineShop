//
//  LoginRouterInput.swift
//  OnlineShop
//
//  Created by Ilxom on 16/03/23.
//

import Foundation

protocol LoginRouterInput {
	func showAlert(with message: String)
	func navigate(to item: LogInNavigationItem)
}
