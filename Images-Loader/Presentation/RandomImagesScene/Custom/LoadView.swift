//
//  LoadView.swift
//  Images-Loader
//
//  Created by taekkim on 2023/03/02.
//

import UIKit

private extension Literal {
    static let buttonTitle = "Load"
}

class LoadButton: UIButton {
    override init(frame: CGRect = .zero) {
        super.init(frame: .zero)
        setTitle(Literal.buttonTitle, for: .normal)
        configUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configUI() {
        backgroundColor = .systemBlue
        layer.cornerRadius = 10
    }
}
