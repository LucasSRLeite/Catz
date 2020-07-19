//
//  CatViewModel.swift
//  Catz
//
//  Created by Lucas Leite on 17/07/20.
//  Copyright © 2020 Lucas Leite. All rights reserved.
//

import Combine
import UIKit

struct CatImageViewModel {
    private let catImage: CatImage
    private let repository: CatImageRepository

    var image: AnyPublisher<UIImage?, Never> {
        repository.fetchImage(for: catImage)
    }

    init?(catImage: CatImage, repository: CatImageRepository = CatImageRepository()) {
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
