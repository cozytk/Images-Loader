//
//  ProgressView.swift
//  Images-Loader
//
//  Created by taekkim on 2023/03/02.
//

import UIKit

final class ProgressView: UIProgressView {
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        progress = 0.5
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
