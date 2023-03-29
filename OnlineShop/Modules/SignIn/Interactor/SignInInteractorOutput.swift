//
//  SignInInteractorOutput.swift
//  OnlineShop
//
//  Created by Ilxom on 13/03/23.
//

import Foundation

protocol SignInInteractorOutput: AnyObject {
	func didSignInCompleted()
	func onError(message: String)
}
