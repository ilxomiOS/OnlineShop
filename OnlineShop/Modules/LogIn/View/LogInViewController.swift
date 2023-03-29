//
//  LogInViewController.swift
//  OnlineShop
//
//  Created by Ilxom on 10/03/23.
//

import UIKit

class LogInViewController: UIViewController {
	
	private lazy var logInView = LogInView()
	
	private let presenter: LogInPresenterInput
	
	init(presenterter: LogInPresenterInput) {
		self.presenter = presenterter
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func loadView() {
		super.loadView()
		view = logInView
	}

    override func viewDidLoad() {
        super.viewDidLoad()
		configure()
    }
	
	private func configure() {
		logInView.onLogIn = { [weak self] (firstName, password) in
			self?.presenter.logIn(firstName: firstName, password: password)
		}
	}

}

extension LogInViewController: LogInPresenterOutput { }
