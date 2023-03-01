//
//  RandomImage.swift
//  Images-Loader
//
//  Created by taekkim on 2023/03/02.
//

import Foundation

struct RandomImage: Codable {
    let urlString: String

    enum CodingKeys: String, CodingKey {
        case urlString = "message"
    }
}
