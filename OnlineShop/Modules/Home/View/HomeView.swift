//
//  HomeView.swift
//  OnlineShop
//
//  Created by Ilxom on 16/03/23.
//

import UIKit

final class HomeView: UIView {
	
	private let locationButton = LocationButton()
	private let searchTextField = SearchTextField()

	init() {
		super.init(frame: .zero)
		configureApperance()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}


private extension HomeView {
	
	func configureApperance() {
		configureView()
		configureSubviews()
		configureConstraints()
	}
	
	func configureView() {
		backgroundColor = .white
		
		addSubview(locationButton)
		addSubview(searchTextField)
	}
	
	func configureSubviews() {
		
	}
	
	func configureConstraints() {
		locationButton.translatesAutoresizingMaskIntoConstraints = false
		searchTextField.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			locationButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
			locationButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
			locationButton.widthAnchor.constraint(equalToConstant: 80),
			
			searchTextField.heightAnchor.constraint(equalToConstant: 27),
			searchTextField.widthAnchor.constraint(equalToConstant: 282),
			searchTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
			searchTextField.topAnchor.constraint(equalTo: locationButton.bottomAnchor, constant: 8)
		])
	}
	
}
