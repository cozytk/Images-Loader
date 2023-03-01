//
//  NetworkRepository.swift
//  Images-Loader
//
//  Created by taekkim on 2023/03/02.
//

import Foundation

protocol NetworkRepository {
    func fetchImage() async throws -> Data
}
