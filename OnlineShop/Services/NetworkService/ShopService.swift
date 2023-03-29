//
//  ShopService.swift
//  OnlineShop
//
//  Created by Ilxom on 28/03/23.
//

import Foundation

protocol ShopServiceable {
	func getLatest() async throws -> Latest
	func getFlashSale() async throws -> FlashSale
}

struct ShopService: HTTPClient, ShopServiceable {
	
	func getLatest() async throws -> Latest {
		return try await sendRequest(endpoint: ShopEndpoints.latest, responseModel: Latest.self)
	}
	
	func getFlashSale() async throws -> FlashSale {
		return try await sendRequest(endpoint: ShopEndpoints.flashSale, responseModel: FlashSale.self)
	}

}
