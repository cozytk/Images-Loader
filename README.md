### 시연
![loadImages](https://user-images.githubusercontent.com/59143479/222225836-08574737-eba7-4dd9-a67e-c081924a7fad.gif)

### 비동기처리
```swift
// Infrasturcture/Network/NetworkManager.swift

import Foundation

final class NetworkManager: NetworkRepository {
    func fetchImage() async throws -> Data {
        let (data, _) = try await URLSession.shared.data(from: URL(string: Literal.randomImageAPI)!)
        let randomImage = try JSONDecoder().decode(RandomImage.self, from: data)
        let imageURL = URL(string: randomImage.urlString)!
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
        Task(priority: .background) {
            photoView.image = UIImage(systemName: Literal.defaultPhoto)!
            let imageData = try await networkRepository.fetchImage()
            photoView.image = UIImage(data: imageData)!
        }
    }

// 전체 이미지
// Presentation/RandomImageScene/RandomImageLoadingController.swift

    @objc private func loadAllImages() {
        imageStacks.arrangedSubviews.forEach { imageStack in
            guard let photoView = imageStack.subviews.first as? UIImageView else { return }
            Task(priority: .background) {
                photoView.image = UIImage(systemName: Literal.defaultPhoto)!
                let data = try await networkManager.fetchImage()
                photoView.image = UIImage(data: data)!
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
