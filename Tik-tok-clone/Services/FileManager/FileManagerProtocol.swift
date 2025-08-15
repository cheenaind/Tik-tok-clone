//
//  FileManagerProtocol.swift
//  Tik-tok-clone
//
//  Created by Kuandik Chingiz on 15.08.25.
//

import Foundation

enum FileExtension: String {
    case json
}

protocol Requestable {
    var url: String { get }
    var path: String { get }
}

protocol FileManagerProtocol {
    
    func read(from requestable: Requestable) async throws  -> Data
}
