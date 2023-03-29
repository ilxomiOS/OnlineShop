//
//  HTTPClient.swift
//  OnlineShop
//
//  Created by Ilxom on 28/03/23.
//

import Foundation

protocol HTTPClient {
	func sendRequest<T: Decodable>(endpoint: Endpoint, responseModel: T.Type) async throws -> T
}

extension HTTPClient {
	func sendRequest<T: Decodable>(
		endpoint: Endpoint,
		responseModel: T.Type
	) async throws -> T {
		var urlComponents = URLComponents()
		urlComponents.scheme = endpoint.scheme
		urlComponents.host = endpoint.host
		urlComponents.path = endpoint.path
		
		guard let url = urlComponents.url else {
			throw RequestError.invalidURL
		}
		
		var request = URLRequest(url: url)
		request.httpMethod = endpoint.method.rawValue
		request.allHTTPHeaderFields = endpoint.header
		
		if let body = endpoint.body {
			request.httpBody = try? JSONSerialization.data(withJSONObject: body)
		}
		
		let (data, response) = try await URLSession.shared.data(for: request)
		
		guard let response = response as? HTTPURLResponse else {
			throw RequestError.noResponse
		}
		
		switch response.statusCode {
		case 200...299:
			guard let decodedResponse = try? JSONDecoder().decode(responseModel, from: data)
			else {
				throw RequestError.decode
			}
			return decodedResponse
		default:
			throw RequestError.unexpectedStatusCode
		}
		
	}
}
