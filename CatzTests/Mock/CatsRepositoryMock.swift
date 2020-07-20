//
//  CatsRepositoryMock.swift
//  CatzTests
//
//  Created by Lucas Leite on 20/07/20.
//  Copyright © 2020 Lucas Leite. All rights reserved.
//

@testable import Catz
import Combine
import Foundation

private let cats = Cats(data: [
    Cat(id: "1", title: "Cat 1", images: [CatImage(id: "1", link: "link 1", type: "image/png")]),
    Cat(id: "2", title: "Cat 2", images: [CatImage(id: "2", link: "link 2", type: "image/jpeg"), CatImage(id: "3", link: "link 3", type: "image/png")]),
    Cat(id: "3", title: "Cat 3", images: [CatImage(id: "4", link: "link 4", type: "video/mp4"), CatImage(id: "5", link: "link 5", type: "image/jpeg")]),
    Cat(id: "4", title: "Cat 4", images: [CatImage(id: "6", link: "link 6", type: "video/mp4")]),
    Cat(id: "5", title: "Cat 5", images: [CatImage(id: "7", link: "link 7", type: "image/png")]),
])

final class CatsRepositoryMock: CatsRepositoryProtocol {
    func fetchCats() -> AnyPublisher<Cats, Never> {
        [cats].publisher.eraseToAnyPublisher()
    }
}
