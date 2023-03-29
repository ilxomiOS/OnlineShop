//
//  AuthError.swift
//  OnlineShop
//
//  Created by Ilxom on 15/03/23.
//

import Foundation

enum AuthError: Error {
	case userDoesntExist
	case userAlreadyExist
	case emptyFirstName
	case emptyLastName
	case invalidEmail
	case invalidPassword
	case errorSavingNewUser
}

extension AuthError: LocalizedError {
	var errorDescription: String? {
		switch self {
		case .userDoesntExist: return "User doesn't exist. Please sign up."
		case .userAlreadyExist: return "User already exist. Pleale login"
		case .emptyFirstName: return "Enter your first name."
		case .emptyLastName: return "Enter your last name."
		case .invalidEmail: return "Invalid email."
		case .errorSavingNewUser: return "Error saving a new user."
		case .invalidPassword: return "Password should be 6 characters long."
		}
	}
}
