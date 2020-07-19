//
//  CatsRepository.swift
//  Catz
//
//  Created by Lucas Leite on 17/07/20.
//  Copyright © 2020 Lucas Leite. All rights reserved.
//

import Combine
import Foundation

final class CatsRepository {
    func fetchCats() -> AnyPublisher<Cats, Never> {
        Just(API.url.value)
            .compactMap { URL(string: $0) }
            .map { url -> URLRequest in
                var request = URLRequest(url: url)
                request.addValue("Client-ID \(API.id.value)", forHTTPHeaderField: "Authorization")
                return request
            }
            .flatMap { request in
                URLSession.shared
                    .dataTaskPublisher(for: request)
                    .map { data, _ in
                        let decoder = JSONDecoder()
                        guard let cats = try? decoder.decode(Cats.self, from: data) else { return Cats(data: []) }
                        return cats
                    }
                    .catch { _ in Empty() }
            }
            .eraseToAnyPublisher()
    }
}
