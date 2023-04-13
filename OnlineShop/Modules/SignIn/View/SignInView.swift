//
//  SignInView.swift
//  OnlineShop
//
//  Created by Ilxom on 10/03/23.
//

import UIKit

final class SignInView: UIView {
	
	var onSave: ((_ firstName: String?,
				  _ lastName: String?,
				  _ email: String?) -> Void)?
	
	var onLogin: (() -> Void)?
	
	private let headerLabel = UILabel()
	private let firstNameTextField = UITextField()
	private let lastNameTextField = UITextField()
	private let emailTextField = UITextField()
	private let signInButton = UIButton()
	private let questionLabel = UILabel()
	private let logInButton = UIButton(type: .system)
	private let googleImageView = UIImageView()
	private let googleButton = UIButton()
	private let appleImageView = UIImageView()
	private let appleButton = UIButton()
	private let logInStackView = UIStackView()
	private let googleSignInStackView = UIStackView()
	private let appleSignInStackView = UIStackView()
	
	init() {
		super.init(frame: .zero)
		configureApperance()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}

private extension SignInView {
	
	func configureApperance() {
		configureView()
		configureSubviews()
		configureConstraints()
	}
	
	func configureView() {
		backgroundColor = .white
		
		addSubview(headerLabel)
		addSubview(firstNameTextField)
		addSubview(lastNameTextField)
		addSubview(emailTextField)
		addSubview(signInButton)
		addSubview(googleImageView)
		addSubview(appleImageView)
		addSubview(logInStackView)
		addSubview(googleSignInStackView)
		addSubview(appleSignInStackView)
	}
	
	func configureSubviews() {
		headerLabel.text = Resources.Strings.SigninStrings.signIn
		headerLabel.textColor = Resources.Colors.title
		headerLabel.font = Resources.Fonts.montserratSemiBold(with: 26)
		
		firstNameTextField.backgroundColor = Resources.Colors.textFieldBackgroundColor
		firstNameTextField.layer.cornerRadius = 15.0
		firstNameTextField.textAlignment = .center
		firstNameTextField.placeholder = Resources.Strings.SigninStrings.firstName
		
		lastNameTextField.backgroundColor = Resources.Colors.textFieldBackgroundColor
		lastNameTextField.layer.cornerRadius = 15.0
		lastNameTextField.textAlignment = .center
		lastNameTextField.placeholder = Resources.Strings.SigninStrings.lastName
		
		emailTextField.backgroundColor = Resources.Colors.textFieldBackgroundColor
		emailTextField.layer.cornerRadius = 15.0
		emailTextField.textAlignment = .center
		emailTextField.placeholder = Resources.Strings.SigninStrings.email
		emailTextField.keyboardType = .emailAddress
		
		signInButton.setTitle(Resources.Strings.SigninStrings.signIn, for: .normal)
		signInButton.backgroundColor = Resources.Colors.buttonBackgroundColor
		signInButton.titleLabel?.font = Resources.Fonts.montserratBold(with: 14)
		signInButton.setTitleColor(Resources.Colors.buttonTitleColor, for: .normal)
		signInButton.layer.cornerRadius = 15.0
		signInButton.startAnimatingPressActions()
		signInButton.addTarget(self, action: #selector(signInButtonPressed), for: .touchUpInside)
		
		questionLabel.text = Resources.Strings.SigninStrings.question
		questionLabel.textColor = Resources.Colors.secondaryLabelColor
		questionLabel.font = Resources.Fonts.montserratMedium(with: 10)
		
		logInButton.setTitle(Resources.Strings.SigninStrings.logIn, for: .normal)
		logInButton.titleLabel?.font = Resources.Fonts.montserratMedium(with: 10)
		logInButton.setTitleColor(Resources.Colors.secondaryButtonTitleColor, for: .normal)
		logInButton.addTarget(self, action: #selector(logInButtonPressed), for: .touchUpInside)
		
		logInStackView.addArrangedSubview(questionLabel)
		logInStackView.addArrangedSubview(logInButton)
		logInStackView.spacing = 5
		
		googleButton.setTitle(Resources.Strings.SigninStrings.googleSignIn, for: .normal)
		googleButton.setTitleColor(.black, for: .normal)
		googleButton.titleLabel?.font = Resources.Fonts.montserratMedium(with: 12)
		googleButton.startAnimatingPressActions()
		
		googleImageView.image = Resources.Images.googleIcon
		googleImageView.contentMode = .scaleAspectFit
		
		googleSignInStackView.addArrangedSubview(googleImageView)
		googleSignInStackView.addArrangedSubview(googleButton)
		googleSignInStackView.spacing = 10
		
		appleButton.setTitle(Resources.Strings.SigninStrings.appleSignIn, for: .normal)
		appleButton.setTitleColor(.black, for: .normal)
		appleButton.titleLabel?.font = Resources.Fonts.montserratMedium(with: 12)
		appleButton.startAnimatingPressActions()
		
		appleImageView.image = Resources.Images.appleIcon
		appleImageView.contentMode = .scaleAspectFit
		
		appleSignInStackView.addArrangedSubview(appleImageView)
		appleSignInStackView.addArrangedSubview(appleButton)
		appleSignInStackView.spacing = 10
	}
	
	func configureConstraints() {
		headerLabel.translatesAutoresizingMaskIntoConstraints = false
		firstNameTextField.translatesAutoresizingMaskIntoConstraints = false
		lastNameTextField.translatesAutoresizingMaskIntoConstraints = false
		emailTextField.translatesAutoresizingMaskIntoConstraints = false
		signInButton.translatesAutoresizingMaskIntoConstraints = false
		logInStackView.translatesAutoresizingMaskIntoConstraints = false
		googleSignInStackView.translatesAutoresizingMaskIntoConstraints = false
		appleSignInStackView.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			headerLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
			headerLabel.topAnchor.constraint(equalTo: topAnchor, constant: 107),
			
			firstNameTextField.widthAnchor.constraint(equalToConstant: 289),
			firstNameTextField.heightAnchor.constraint(equalToConstant: 29),
			firstNameTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
			firstNameTextField.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 60),
			
			lastNameTextField.widthAnchor.constraint(equalToConstant: 289),
			lastNameTextField.heightAnchor.constraint(equalToConstant: 29),
			lastNameTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
			lastNameTextField.topAnchor.constraint(equalTo: firstNameTextField.bottomAnchor, constant: 35),
			
			emailTextField.widthAnchor.constraint(equalToConstant: 289),
			emailTextField.heightAnchor.constraint(equalToConstant: 29),
			emailTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
			emailTextField.topAnchor.constraint(equalTo: lastNameTextField.bottomAnchor, constant: 35),
			
			signInButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 289),
			signInButton.heightAnchor.constraint(equalToConstant: 46),
			signInButton.centerXAnchor.constraint(equalTo: centerXAnchor),
			signInButton.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 35),
			
			logInStackView.leadingAnchor.constraint(equalTo: signInButton.leadingAnchor),
			logInStackView.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 15),
			
			googleImageView.widthAnchor.constraint(equalToConstant: 24),
			googleImageView.heightAnchor.constraint(equalToConstant: 24),
			
			googleSignInStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
			googleSignInStackView.topAnchor.constraint(equalTo: logInStackView.bottomAnchor, constant: 70),
			
			appleImageView.widthAnchor.constraint(equalToConstant: 24),
			appleImageView.heightAnchor.constraint(equalToConstant: 24),
			
			appleSignInStackView.leadingAnchor.constraint(equalTo: googleSignInStackView.leadingAnchor),
			appleSignInStackView.topAnchor.constraint(equalTo: googleSignInStackView.bottomAnchor, constant: 38)
		])
	}
	
	@objc
	private func signInButtonPressed() {
		onSave?(
			firstNameTextField.text,
			lastNameTextField.text,
			emailTextField.text
		)
	}
	
	@objc
	private func logInButtonPressed() {
		onLogin?()
	}
	
}
