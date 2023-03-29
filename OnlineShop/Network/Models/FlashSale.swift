//
//  FlashSale.swift
//  OnlineShop
//
//  Created by Ilxom on 28/03/23.
//

import Foundation

struct FlashSale: Decodable {
	
	let flashSale: [FlashSales]
	
	enum CodingKeys: String, CodingKey {
		case flashSale = "flash_sale"
	}
	
}

struct FlashSales: Decodable {
	
	let category: String
	let name: String
	let price: Double
	let discount: Int
	let imageURL: String
	
	enum CodingKeys: String, CodingKey {
		case category
		case name
		case price
		case discount
		case imageURL = "image_url"
	}
	
}
