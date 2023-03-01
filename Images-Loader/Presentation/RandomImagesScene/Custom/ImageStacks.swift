//
//  ImageStacks.swift
//  Images-Loader
//
//  Created by taekkim on 2023/03/02.
//

import UIKit

final class ImageStacks: UIStackView {
    init(frame: CGRect = .zero, imageStacks: [UIStackView]) {
        super.init(frame: frame)
        imageStacks.forEach { imageStack in
            addArrangedSubview(imageStack)
        }
        configUI()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configUI() {
        distribution = .fillEqually
        axis = .vertical
    }

}
