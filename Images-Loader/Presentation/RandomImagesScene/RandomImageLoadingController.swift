//
//  ViewController.swift
//  Images-Loader
//
//  Created by taekkim on 2023/03/01.
//

import UIKit

import SnapKit

final class RandomImageLoadingController: UIViewController {
    private let networkManager = NetworkManager()
    private lazy var imageStacks = ImageStacks(imageStacks: [
        ImageStack(photoView: PhotoView(), progressView: ProgressView(), loadButton: LoadButton(), networkRepository: networkManager),
        ImageStack(photoView: PhotoView(), progressView: ProgressView(), loadButton: LoadButton(), networkRepository: networkManager),
        ImageStack(photoView: PhotoView(), progressView: ProgressView(), loadButton: LoadButton(), networkRepository: networkManager),
        ImageStack(photoView: PhotoView(), progressView: ProgressView(), loadButton: LoadButton(), networkRepository: networkManager),
        ImageStack(photoView: PhotoView(), progressView: ProgressView(), loadButton: LoadButton(), networkRepository: networkManager),
    ])

    private lazy var loadAllImagesButton = LoadAllImagesButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setButton()
        render()
    }

    private func setButton() {
        loadAllImagesButton.addTarget(self, action: #selector(loadAllImages), for: .touchUpInside)
    }

    @objc private func loadAllImages() {
        imageStacks.arrangedSubviews.forEach { imageStack in
            guard let photoView = imageStack.subviews.first as? UIImageView else { return }
            Task {
                photoView.image = UIImage(systemName: Literal.defaultPhoto) ?? UIImage()
                let data = try await networkManager.fetchImage()
                photoView.image = UIImage(data: data) ?? UIImage()
            }
        }
    }

    private func render() {
        view.addSubview(imageStacks)
        imageStacks.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            $0.horizontalEdges.equalToSuperview().inset(16)
        }

        view.addSubview(loadAllImagesButton)
        loadAllImagesButton.snp.makeConstraints {
            $0.top.equalTo(imageStacks.snp.bottom).offset(16)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(40)
        }
    }
}
