//
//  LoadAllImagesButton.swift
//  Images-Loader
//
//  Created by taekkim on 2023/03/02.
//

import UIKit

private extension Literal {
    static let buttonTitle = "Load All Images"
}

final class LoadAllImagesButton: LoadButton {
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setButton()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setButton() {
        setTitle(Literal.buttonTitle, for: .normal)
    }
}
