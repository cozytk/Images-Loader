//
//  ImageStack.swift
//  Images-Loader
//
//  Created by taekkim on 2023/03/02.
//

import UIKit

import SnapKit

final class ImageStack: UIStackView {
    private let photoView: UIImageView
    private let progressView: UIProgressView
    private let loadButton: UIButton
    private let networkRepository: NetworkRepository

    init(frame: CGRect = .zero, photoView: UIImageView, progressView: UIProgressView, loadButton: UIButton, networkRepository: NetworkRepository) {
        self.photoView = photoView
        self.progressView = progressView
        self.loadButton = loadButton
        self.networkRepository = networkRepository
        super.init(frame: frame)
        addArrangedSubviews()
        setButton()
        configUI()
        render()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configUI() {
        distribution = .equalSpacing
        alignment = .center
        axis = .horizontal
    }

    private func render() {
        photoView.snp.makeConstraints {
            $0.height.equalTo(80)
            $0.width.equalTo(160)
        }

        progressView.snp.makeConstraints {
            $0.height.equalTo(10)
            $0.width.equalTo(100)
        }

        loadButton.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.width.equalTo(100)
        }
    }

    private func addArrangedSubviews() {
        addArrangedSubview(photoView)
        addArrangedSubview(progressView)
        addArrangedSubview(loadButton)
    }

    private func setButton() {
        loadButton.addTarget(self, action: #selector(loadImage), for: .touchUpInside)
    }

    @objc private func loadImage() {
        Task(priority: .background) {
            photoView.image = UIImage(systemName: Literal.defaultPhoto)!
            let imageData = try await networkRepository.fetchImage()
            photoView.image = UIImage(data: imageData)!
        }
    }

}
