//
//  SearchTextField.swift
//  OnlineShop
//
//  Created by Ilxom on 13/04/23.
//

import UIKit

final class SearchTextField: UITextField {
	
	private let image = UIImage(named: "search")
	private let imageView = UIImageView()
	
	init() {
		super.init(frame: .zero)
		configureApperance()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func configureApperance() {
		
		placeholder = Resources.Strings.HomeStrings.searchTFplaceHolder
		font = Resources.Fonts.montserratRegular(with: 12)
		backgroundColor = Resources.Colors.searchTFBackgroundColor
		layer.cornerRadius = 15.0
		textAlignment = .center
		
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.image = image
		imageView.contentMode = .center
		addSubview(imageView)
		
		NSLayoutConstraint.activate([			
			imageView.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor),
			imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
			imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
			imageView.heightAnchor.constraint(equalToConstant: 16),
			imageView.widthAnchor.constraint(lessThanOrEqualTo: widthAnchor)
		])
	}
	
}
