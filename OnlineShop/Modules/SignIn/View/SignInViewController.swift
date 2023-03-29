//
//  SignInViewController.swift
//  OnlineShop
//
//  Created by Ilxom on 10/03/23.
//

import UIKit

final class SignInViewController: UIViewController {
	
	private lazy var signInView = SignInView()
	private let presenter: SignInPresenterInput
	
	init(presenter: SignInPresenterInput) {
		self.presenter = presenter
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func loadView() {
		super.loadView()
		view = signInView
	}

    override func viewDidLoad() {
        super.viewDidLoad()
		configure()
    }
	
	private func configure() {
		signInView.onSave = { [weak self] (firstName, lastName, email) in
			self?.presenter.signIn(firstName: firstName,
										  lastName: lastName,
										  email: email)
		}
		
		signInView.onLogin = { [weak self] in
			self?.presenter.showLoginScreen()
		}
	}

}

extension SignInViewController: SignInPresenterOutput { }
