//
//  Alert.swift
//  OnlineShop
//
//  Created by Ilxom on 16/03/23.
//

import UIKit

enum Alert {
	static func showAlert(message: String, viewController: UIViewController?) {
		let alertVC = UIAlertController(title: nil, message: message, preferredStyle: .alert)
		let alertAction = UIAlertAction(title: "OK", style: .cancel)
		alertVC.addAction(alertAction)
		viewController?.present(alertVC, animated: true)
	}
}
