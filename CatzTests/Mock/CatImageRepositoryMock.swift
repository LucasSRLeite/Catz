//
//  CatImageRepositoryMock.swift
//  CatzTests
//
//  Created by Lucas Leite on 20/07/20.
//  Copyright © 2020 Lucas Leite. All rights reserved.
//

@testable import Catz
import Combine
import UIKit

final class CatImageRepositoryMock: CatImageRepositoryProtocol {
    private let imageSubject = PassthroughSubject<UIImage?, Never>()

    func fetchImage(for catImage: CatImage) -> AnyPublisher<UIImage?, Never> {
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.1) { [weak self] in
            self?.imageSubject.send(UIImage())
        }
        return imageSubject.eraseToAnyPublisher()
    }
}
