//
//  NetworkManager.swift
//  Images-Loader
//
//  Created by taekkim on 2023/03/01.
//

import Foundation

final class NetworkManager: NetworkRepository {
    func fetchImage() async throws -> Data {
        let (data, _) = try await URLSession.shared.data(from: URL(string: Literal.randomImageAPI)!)
        let randomImage = try JSONDecoder().decode(RandomImage.self, from: data)
        let imageURL = URL(string: randomImage.urlString)!
        let (imageData, _) = try await URLSession.shared.data(from: imageURL)
        return imageData
    }
}
