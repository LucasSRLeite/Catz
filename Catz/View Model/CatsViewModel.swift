//
//  CatsViewModel.swift
//  Catz
//
//  Created by Lucas Leite on 17/07/20.
//  Copyright © 2020 Lucas Leite. All rights reserved.
//

import Combine
import CombineExt
import Foundation

final class CatsViewModel {
    private let repository: CatsRepositoryProtocol

    private var cats: AnyPublisher<[Cat], Never> {
        repository.fetchCats()
            .map { $0.data }
            .share()
            .eraseToAnyPublisher()
    }

    private var images: AnyPublisher<[CatImage], Never> {
        cats
            .mapMany { $0.images ?? [] }
            .map { Array($0.joined()) }
            .eraseToAnyPublisher()
    }

    var catModels: AnyPublisher<[CatImageViewModel], Never> {
        images
            .compactMapMany { CatImageViewModel(catImage: $0) }
            .eraseToAnyPublisher()
    }

    init(repository: CatsRepositoryProtocol = CatsRepository()) {
        self.repository = repository
    }
}
