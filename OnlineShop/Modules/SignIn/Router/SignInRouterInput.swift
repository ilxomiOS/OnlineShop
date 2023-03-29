//
//  SignInRouterInput.swift
//  OnlineShop
//
//  Created by Ilxom on 13/03/23.
//

import Foundation

protocol SignInRouterInput {
	func showAlert(with message: String)
	func navigate(to item: SignInNavigationItem)
}
