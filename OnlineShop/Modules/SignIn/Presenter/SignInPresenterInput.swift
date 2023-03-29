//
//  SignInPresenterInput.swift
//  OnlineShop
//
//  Created by Ilxom on 13/03/23.
//

import Foundation

protocol SignInPresenterInput {
	func signIn(firstName: String?, lastName: String?, email: String?)
	func showLoginScreen()
}
