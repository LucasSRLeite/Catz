//
//  CatViewModel.swift
//  Catz
//
//  Created by Lucas Leite on 17/07/20.
//  Copyright © 2020 Lucas Leite. All rights reserved.
//

import Combine
import CombineExt
import UIKit

final class CatImageViewModel {
    private let catImage: CatImage
    private let repository: CatImageRepositoryProtocol

    private var isRequestingSubject = CurrentValueSubject<Bool, Never>(true)

    var image: AnyPublisher<UIImage?, Never> {
        repository.fetchImage(for: catImage)
            .handleEvents(receiveOutput: { [weak self] image in
                self?.isRequestingSubject.send(false)
            })
            .eraseToAnyPublisher()
    }

    var isRequesting: AnyPublisher<Bool, Never> {
        isRequestingSubject.eraseToAnyPublisher()
    }

    init?(catImage: CatImage, repository: CatImageRepositoryProtocol = CatImageRepository()) {
        guard catImage.isImage else { return nil }
        self.catImage = catImage
        self.repository = repository
    }
}

// MARK: Hashable

extension CatImageViewModel: Hashable {
    static func == (lhs: CatImageViewModel, rhs: CatImageViewModel) -> Bool {
        lhs.catImage == rhs.catImage
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(catImage)
    }
}
