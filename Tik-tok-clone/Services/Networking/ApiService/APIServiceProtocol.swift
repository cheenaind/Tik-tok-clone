//
//  APIServiceProtocol.swift
//  Tik-tok-clone
//
//  Created by Kuandik Chingiz on 15.08.25.
//

protocol APIServiceProtocol {
    func fetch<T: Decodable>(with requestable: Requestable) async throws -> T
}
