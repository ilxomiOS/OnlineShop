//
//  TabBar.swift
//  OnlineShop
//
//  Created by Ilxom on 17/03/23.
//

import UIKit

enum Tabs: Int, CaseIterable {
	case home
	case favourite
	case basket
	case chat
	case profile
}

final class TabBar: UITabBarController {
	
	override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
		super.init(nibName: nil, bundle: nil)
		configureAppearance()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func configureAppearance() {
		let newHeight: CGFloat = 100
	
		let roundedLayer = CAShapeLayer()

		let bezierPath = UIBezierPath(
			roundedRect: CGRect(
				x: tabBar.bounds.origin.x,
				y: tabBar.bounds.minY - 15,
				width: tabBar.bounds.width,
				height: newHeight
			),
			cornerRadius: 30
		)
		roundedLayer.path = bezierPath.cgPath
		tabBar.layer.insertSublayer(roundedLayer, at: 0)
		
		roundedLayer.fillColor = UIColor.white.cgColor
		tabBar.tintColor = Resources.Colors.tabBarTint
		
		let controllers: [UINavigationController] = Tabs.allCases.map { tab in
			let controller = UINavigationController(rootViewController: getController(for: tab))
			controller.tabBarItem = UITabBarItem(title: nil, image: Resources.Images.TabBar.icon(for: tab), tag: tab.rawValue)
			return controller
		}
		
		setViewControllers(controllers, animated: true)
	}
	
	private func getController(for tab: Tabs) -> UIViewController {
		switch tab {
		case .home: return HomeAssembly.createView()
		case .favourite: return UIViewController()
		case .basket: return UIViewController()
		case .chat: return UIViewController()
		case .profile: return UIViewController()
		}
	}
	
}
