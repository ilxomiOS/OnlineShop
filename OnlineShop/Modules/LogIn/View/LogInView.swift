//
//  LogInView.swift
//  OnlineShop
//
//  Created by Ilxom on 10/03/23.
//

import UIKit

class LogInView: UIView {
	
	var onLogIn: ((_ firstName: String?, _ password: String?) -> Void)?
	
	// MARK: - Subviews
	
	private let headerLabel = UILabel()
	private let firstNameTextField = UITextField()
	private let passwordTextField = PasswordTextField()
	private let loginButton = UIButton()
	
	// MARK: - Lifecycle
	
	init() {
		super.init(frame: .zero)
		configureApperance()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}

private extension LogInView {
	
	func configureApperance() {
		configureView()
		configureSubviews()
		configureConstraints()
	}
	
	func configureView() {
		backgroundColor = .white
		
		addSubview(headerLabel)
		addSubview(firstNameTextField)
		addSubview(passwordTextField)
		addSubview(loginButton)
	}
	
	func configureSubviews() {
		headerLabel.text = Resources.Strings.LoginStrings.header
		headerLabel.textColor = Resources.Colors.title
		headerLabel.font = Resources.Fonts.montserratSemiBold(with: 26)
		
		firstNameTextField.backgroundColor = Resources.Colors.textFieldBackgroundColor
		firstNameTextField.layer.cornerRadius = 15.0
		firstNameTextField.textAlignment = .center
		firstNameTextField.placeholder = Resources.Strings.LoginStrings.firstName
		
		loginButton.setTitle(Resources.Strings.LoginStrings.login, for: .normal)
		loginButton.backgroundColor = Resources.Colors.buttonBackgroundColor
		loginButton.setTitleColor(Resources.Colors.buttonTitleColor, for: .normal)
		loginButton.layer.cornerRadius = 15.0
		loginButton.startAnimatingPressActions()
		loginButton.addTarget(self, action: #selector(logInButtonPressed), for: .touchUpInside)
	}
	
	func configureConstraints() {
		headerLabel.translatesAutoresizingMaskIntoConstraints = false
		firstNameTextField.translatesAutoresizingMaskIntoConstraints = false
		passwordTextField.translatesAutoresizingMaskIntoConstraints = false
		loginButton.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			headerLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
			headerLabel.topAnchor.constraint(equalTo: topAnchor, constant: 107),
			
			firstNameTextField.widthAnchor.constraint(equalToConstant: 289),
			firstNameTextField.heightAnchor.constraint(equalToConstant: 29),
			firstNameTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
			firstNameTextField.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 60),
			
			passwordTextField.widthAnchor.constraint(equalToConstant: 289),
			passwordTextField.heightAnchor.constraint(equalToConstant: 29),
			passwordTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
			passwordTextField.topAnchor.constraint(equalTo: firstNameTextField.bottomAnchor, constant: 35),
			
			loginButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 289),
			loginButton.heightAnchor.constraint(equalToConstant: 46),
			loginButton.centerXAnchor.constraint(equalTo: centerXAnchor),
			loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 99)
		])
	}
	
	@objc
	func logInButtonPressed() {
		onLogIn?(firstNameTextField.text, passwordTextField.text)
	}
	
}
