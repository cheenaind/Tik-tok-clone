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

protocol FileNetworkServiceProtocol: NetworkServiceProtocol {
    func makeRequest(with requestable: FileRequestable) async throws -> Data
}

extension FileNetworkServiceProtocol {
    func makeRequest(with requestable: any Requestable) async throws -> Data {
        fatalError("Need to request via file protocol")
    }
}
