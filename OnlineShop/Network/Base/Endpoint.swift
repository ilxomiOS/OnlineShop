//
//  Endpoint.swift
//  OnlineShop
//
//  Created by Ilxom on 28/03/23.
//

import Foundation

protocol Endpoint {
	var scheme: String { get }
	var host: String { get }
	var path: String { get }
	var method: RequestMethod { get }
	var header: [String: String]? { get }
	var body: [String: String]? { get }
}
