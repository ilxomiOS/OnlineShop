//
//  PasswordTextField.swift
//  OnlineShop
//
//  Created by Ilxom on 17/03/23.
//

import UIKit

final class PasswordTextField: UITextField {
	
	let eyeButton = UIButton(type: .system)
	
	override var isSecureTextEntry: Bool {
		didSet {
			if isSecureTextEntry {
				eyeButton.setImage(Resources.Images.eyeOff, for: .normal)
			} else {
				eyeButton.setImage(Resources.Images.eyeOn, for: .normal)
			}
		}
	}
	
	init() {
		super.init(frame: .zero)
		configureTextField()
		updateView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func configureTextField() {
		layer.cornerRadius = 15.0
		textAlignment = .center
		backgroundColor = Resources.Colors.textFieldBackgroundColor
		placeholder = Resources.Strings.LoginStrings.password
		isSecureTextEntry = true
	}
	
	private func updateView() {
		rightViewMode = .always
		
		eyeButton.translatesAutoresizingMaskIntoConstraints = false
		eyeButton.widthAnchor.constraint(equalToConstant: 15).isActive = true
		eyeButton.heightAnchor.constraint(equalToConstant: 15).isActive = true
		eyeButton.tintColor = .lightGray
		eyeButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
		
		let stack = UIStackView(arrangedSubviews: [
			eyeButton,
			createHorizontalPaddingView()
		])
		stack.axis = .horizontal
		rightView = stack
		
		rightView = stack
	}
	
	private func createHorizontalPaddingView() -> UIView {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.widthAnchor.constraint(equalToConstant: 12).isActive = true
		return view
	}
	
	@objc
	private func buttonPressed() {
		isSecureTextEntry.toggle()
	}
	
}
