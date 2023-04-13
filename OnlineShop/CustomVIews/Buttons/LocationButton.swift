//
//  LocationButton.swift
//  OnlineShop
//
//  Created by Ilxom on 11/04/23.
//

import UIKit

final class LocationButton: UIButton {
	
	private let title = UILabel()
	private let image = UIImageView()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		configureApperance()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func configureApperance() {
		startAnimatingPressActions()
		
		title.text = "Location"
		title.textColor = Resources.Colors.title
		title.font = Resources.Fonts.montserratRegular(with: 12)
		
		image.image = UIImage(named: "down")
		image.image?.withTintColor(Resources.Colors.title)
		image.contentMode = .scaleAspectFit
		
		title.translatesAutoresizingMaskIntoConstraints = false
		image.translatesAutoresizingMaskIntoConstraints = false
		
		addSubview(title)
		addSubview(image)
		
		NSLayoutConstraint.activate([
			title.centerXAnchor.constraint(equalTo: centerXAnchor),
			title.centerYAnchor.constraint(equalTo: centerYAnchor),
			
			image.leadingAnchor.constraint(equalTo: title.trailingAnchor, constant: 5),
			image.centerYAnchor.constraint(equalTo: centerYAnchor)
		])
	}
	
}
