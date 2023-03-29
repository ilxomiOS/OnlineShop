//
//  LogInInteractorOutput.swift
//  OnlineShop
//
//  Created by Ilxom on 16/03/23.
//

import Foundation

protocol LogInInteractorOutput: AnyObject {
	func didLogInCompleted()
	func onError(message: String)
}
