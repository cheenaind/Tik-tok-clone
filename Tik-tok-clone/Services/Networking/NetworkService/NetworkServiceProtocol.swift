//
//  NetworkServiceProtocol.swift
//  Tik-tok-clone
//
//  Created by Kuandik Chingiz on 15.08.25.
//

import Foundation

protocol NetworkServiceProtocol {
    func makeRequest(with requestable: Requestable) async throws -> Data
}
