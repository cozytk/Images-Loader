//
//  PhotoView.swift
//  Images-Loader
//
//  Created by taekkim on 2023/03/02.
//

import UIKit

final class PhotoView: UIImageView {
    private let defaultPhoto: UIImage = {
        let image = UIImage(systemName: Literal.defaultPhoto)!
        return image
    }()

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        image = defaultPhoto
        contentMode = .scaleAspectFit
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
