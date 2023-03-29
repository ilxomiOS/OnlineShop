//
//  Resources.swift
//  OnlineShop
//
//  Created by Ilxom on 10/03/23.
//

import UIKit

enum Resources {
	
	enum Colors {
		static let headerLabelColor = UIColor(hexString: "#161826")
		static let textFieldBackgroundColor = UIColor(hexString: "#E8E8E8")
		static let buttonBackgroundColor = UIColor(hexString: "#4E55D7")
		static let buttonTitleColor = UIColor(hexString: "#EAEAEA")
		static let secondaryLabelColor = UIColor(hexString: "#808080")
		static let secondaryButtonTitleColor = UIColor(hexString: "#254FE6")
		static let tabBarTint = UIColor(hexString: "#737297")
	}
	
	enum Strings {
		enum SigninStrings {
			static let signIn = "Sign in"
			static let firstName = "First name"
			static let lastName = "Last name"
			static let email = "Email"
			static let question = "Already have an account?"
			static let googleSignIn = "Sign in with Google"
			static let appleSignIn = "Sign in with Apple"
			static let logIn = "Log in"
		}
		
		enum LoginStrings {
			static let header = "Welcome back"
			static let login = "Login"
			static let firstName = "First name"
			static let password = "Password"
		}
	}
	
	enum Images {
		static let googleIcon = UIImage(named: "googleIcon")
		static let appleIcon = UIImage(named: "appleIcon")
		static let eyeOn = UIImage(named: "eyeOn")
		static let eyeOff = UIImage(named: "eyeOff")
		
		enum TabBar {
			static func icon(for tab: Tabs) -> UIImage? {
				switch tab {
				case .home: return UIImage(named: "home")
				case .favourite: return UIImage(named: "favourite")
				case .basket: return UIImage(named: "basket")
				case .chat: return UIImage(named: "chat")
				case .profile: return  UIImage(named: "profile")
				}
			}
		}
	}
	
	enum Fonts {
		static func montserratBold(with size: CGFloat) -> UIFont {
			UIFont(name: "Montserrat-Bold", size: size) ?? UIFont()
		}
		
		static func montserratMedium(with size: CGFloat) -> UIFont {
			UIFont(name: "Montserrat-Medium", size: size) ?? UIFont()
		}
		
		static func montserratSemiBold(with size: CGFloat) -> UIFont {
			UIFont(name: "Montserrat-SemiBold", size: size) ?? UIFont()
		}
	}
	
}
