//
//  HomeViewController.swift
//  OnlineShop
//
//  Created by Ilxom on 16/03/23.
//

import UIKit

class HomeViewController: UIViewController {
	
	private lazy var homeView = HomeView()
	private let presenter: HomePresenterInput
	
	init(presenter: HomePresenterInput) {
		self.presenter = presenter
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func loadView() {
		super.loadView()
		view = homeView
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension HomeViewController: HomePresenterOutput { }
