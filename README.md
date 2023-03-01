### 시연
![loadImages](https://user-images.githubusercontent.com/59143479/222225836-08574737-eba7-4dd9-a67e-c081924a7fad.gif)

### 비동기처리
```swift
// Infrasturcture/Network/NetworkManager.swift

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
```

```swift
// 단일 이미지
// Presentation/RandomImageScene/Custom/ImageStack.swift

   ...

    @objc private func loadImage() {
        Task {
            photoView.image = UIImage(systemName: Literal.defaultPhoto) ?? UIImage()
            let imageData = try await networkRepository.fetchImage()
            photoView.image = UIImage(data: imageData) ?? UIImage()
        }
    }

// 전체 이미지
// Presentation/RandomImageScene/RandomImageLoadingController.swift

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
```

### 기술
- UIKit
- UIStackView
- Swift Concurrency
- SnapKit

### API
[랜덤 강아지 사진 API](https://dog.ceo/api/breeds/image/random)
