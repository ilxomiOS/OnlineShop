//
//  Latest.swift
//  OnlineShop
//
//  Created by Ilxom on 28/03/23.
//

import Foundation

struct Latest: Decodable {
	
	let latest: [Latests]
	
}

struct Latests: Decodable {
	
	let category: String
	let name: String
	let price: Double
	let imageURL: String
	
	enum CodingKeys: String, CodingKey {
		case category
		case name
		case price
		case imageURL = "image_url"
	}
	
}
