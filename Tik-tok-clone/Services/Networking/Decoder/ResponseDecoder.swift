//
//  ResponseDecoder.swift
//  Tik-tok-clone
//
//  Created by Kuandik Chingiz on 18.08.25.
//

import Foundation

protocol ResponseDecoderProtocol {
    func decode<T: Decodable>(_ data: Data) async throws -> T
}

final class NetworkResponseDecoder: ResponseDecoderProtocol {
    private var decoder: JSONDecoder {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSZ"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(formatter)
        return decoder
    }
    
    func decode<T: Decodable>(_ data: Data) async throws -> T {
        return try decoder.decode(T.self, from: data)
    }
}
