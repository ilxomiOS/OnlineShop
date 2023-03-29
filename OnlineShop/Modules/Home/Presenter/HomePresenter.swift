//
//  HomePresenter.swift
//  OnlineShop
//
//  Created by Ilxom on 16/03/23.
//

import Foundation

final class HomePresenter {
	
	private let interactor: HomeInteractorInput
	private let router: HomeRouterInput
	weak var view: HomePresenterOutput?
	
	init(interactor: HomeInteractorInput, router: HomeRouterInput) {
		self.interactor = interactor
		self.router = router
	}
	
}

extension HomePresenter: HomePresenterInput {
	
}

extension HomePresenter: HomeInteractorOutput {
	
}
