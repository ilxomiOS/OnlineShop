//
//  HomeAssembly.swift
//  OnlineShop
//
//  Created by Ilxom on 16/03/23.
//

import UIKit

enum HomeAssembly {
	
	static func createView() -> UIViewController {
		let router = HomeRouter()
		let interactor = HomeInteractor()
		let presenter = HomePresenter(interactor: interactor, router: router)
		let view = HomeViewController(presenter: presenter)
		
		interactor.presenter = presenter
		presenter.view = view
		router.view = view
		
		configureNavBar(view)
		
		return view
	}

}

extension HomeAssembly {
	
	private static func configureNavBar(_ view: UIViewController) {
		
		// leftBarButtonItem
		view.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "navicon"), style: .done, target: nil, action: nil)
		view.navigationItem.leftBarButtonItem?.tintColor = .black
		
		// title
		let attributes: [NSAttributedString.Key: Any] = [
			.font: Resources.Fonts.montserratBold(with: 20.0),
			.foregroundColor: Resources.Colors.title
		]
		
		let attributedTitle = NSMutableAttributedString(string: Resources.Strings.HomeStrings.navTitle, attributes: attributes)
		let range = (Resources.Strings.HomeStrings.navTitle as NSString).range(of: "bata")
		attributedTitle.addAttribute(.foregroundColor, value: Resources.Colors.homeViewTitleColor, range: range)
		
		let titleLabel = UILabel()
		titleLabel.attributedText = attributedTitle
		titleLabel.textAlignment = .center
		view.navigationItem.titleView = titleLabel
		
		// rightBarButtonItem
		let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 36, height: 36))
		imageView.contentMode = .scaleAspectFill
		imageView.clipsToBounds = true
		imageView.layer.cornerRadius = imageView.frame.size.width / 2
		imageView.layer.borderWidth = 1
		imageView.layer.borderColor = Resources.Colors.profileImageBorderColor.cgColor
		imageView.image = UIImage(systemName: "person")

		let rightItem = UIBarButtonItem(customView: imageView)
		let space = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
		space.width = 25
		view.navigationItem.rightBarButtonItems = [space, rightItem]
	}
	
}
