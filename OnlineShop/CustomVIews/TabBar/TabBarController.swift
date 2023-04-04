//
//  TabBarController.swift
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
	
	let circleView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
	
	var selectedTab: Int = 0 {
		didSet {
			guard let viewControllers = viewControllers, !viewControllers.isEmpty else {
				return
			}

			let xPosition = tabBar.frame.width / CGFloat(viewControllers.count) * CGFloat(selectedIndex) + tabBar.frame.width / CGFloat(viewControllers.count) / 2 - circleView.frame.width / 2
			UIView.animate(withDuration: 0.3) {
				self.circleView.frame.origin.x = xPosition
			}
		}
	}
	
	override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
		super.init(nibName: nil, bundle: nil)
		configureAppearance()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func configureAppearance() {
		delegate = self
		tabBar.addSubview(circleView)
		
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
		
		circleView.layer.cornerRadius = 20
		circleView.backgroundColor =  Resources.Colors.tabBarCircleBackgroundColor
		circleView.frame.origin.x = tabBar.frame.width / CGFloat(controllers.count) / 2 - circleView.frame.width / 2
		
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

extension TabBar: UITabBarControllerDelegate {
	func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
		selectedTab = tabBarController.selectedIndex
	}
}
