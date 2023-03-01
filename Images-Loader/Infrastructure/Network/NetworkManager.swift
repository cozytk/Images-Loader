//
//  NetworkManager.swift
//  Images-Loader
//
//  Created by taekkim on 2023/03/01.
//

import Foundation

final class NetworkManager: NetworkRepository {
    private enum FetchError: Error {
        case invalidAPIURL
        case invalidImageURL
    }

    func fetchImage() async throws -> Data {
        guard let apiURL = URL(string: Literal.randomImageAPI) else { throw FetchError.invalidAPIURL }
        let (data, _) = try await URLSession.shared.data(from: apiURL)
        let randomImage = try JSONDecoder().decode(RandomImage.self, from: data)
        guard let imageURL = URL(string: randomImage.urlString) else { throw FetchError.invalidImageURL }
        let (imageData, _) = try await URLSession.shared.data(from: imageURL)
        return imageData
    }
}
