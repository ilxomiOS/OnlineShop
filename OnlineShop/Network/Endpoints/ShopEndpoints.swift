//
//  ShopEndpoints.swift
//  OnlineShop
//
//  Created by Ilxom on 28/03/23.
//

import Foundation

enum ShopEndpoints {
	case latest
	case flashSale
}

extension ShopEndpoints: Endpoint {
	
	var scheme: String {
		switch self {
		case .latest, .flashSale:
			return "https"
		}
	}
	
	var host: String {
		switch self {
		case .latest, .flashSale:
			return "run.mocky.io"
		}
	}
	
	var path: String {
		switch self {
		case .latest:
			return "/v3/cc0071a1-f06e-48fa-9e90-b1c2a61eaca7"
		case .flashSale:
			return "/v3/a9ceeb6e-416d-4352-bde6-2203416576ac"
		}
	}
	
	var method: RequestMethod {
		switch self {
		case .latest, .flashSale:
			return .get
		}
	}
	
	var header: [String : String]? {
		switch self {
		case .latest, .flashSale:
			return nil
		}
	}
	
	var body: [String : String]? {
		switch self {
		case .latest, .flashSale:
			return nil
		}
	}
	
}
