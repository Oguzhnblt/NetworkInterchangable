//
//  NetworkService.swift
//  Network Interchangable
//
//  Created by Oğuz on 16.08.2023.
//

import Foundation

protocol NetworkService {
    func download(_ resource: String) async throws -> [User]
    var type: String {get}
}
