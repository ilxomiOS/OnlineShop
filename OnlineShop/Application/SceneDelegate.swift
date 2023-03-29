//
//  SceneDelegate.swift
//  OnlineShop
//
//  Created by Ilxom on 10/03/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?

	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		guard let windowScene = (scene as? UIWindowScene) else { return }
		let window = UIWindow(windowScene: windowScene)
		window.rootViewController = SignInAssembly.createView()
		window.makeKeyAndVisible()
		self.window = window
	}

}

