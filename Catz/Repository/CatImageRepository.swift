//
//  CatRepository.swift
//  Catz
//
//  Created by Lucas Leite on 17/07/20.
//  Copyright © 2020 Lucas Leite. All rights reserved.
//

import Combine
import UIKit

final class CatImageRepository {
    func fetchImage(for catImage: CatImage) -> AnyPublisher<UIImage?, Never> {
        Just(catImage.link)
            .compactMap { URL(string: $0) }
            .flatMap { url -> AnyPublisher<UIImage?, Never> in
                if let cachedImage = ImageCacheHandler.shared.image(for: url.absoluteString) {
                    return [cachedImage].publisher.eraseToAnyPublisher()
                }
                return URLSession.shared
                    .dataTaskPublisher(for: url)
                    .map { UIImage(data: $0.data) }
                    .handleEvents(receiveOutput: { image in
                        guard let image = image else { return }
                        ImageCacheHandler.shared.setImage(image, for: url.absoluteString)
                    })
                    .catch { _ in Empty() }
                    .eraseToAnyPublisher()
            }
            .share()
            .eraseToAnyPublisher()
    }
}
