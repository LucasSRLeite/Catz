//
//  Publisher+CompactMapMany.swift
//  Catz
//
//  Created by Lucas Leite on 19/07/20.
//  Copyright © 2020 Lucas Leite. All rights reserved.
//

import Combine
import Foundation

extension Publisher where Output: Collection {
    func compactMapMany<Result>(_ transform: @escaping (Output.Element) -> Result?) -> Publishers.Map<Self, [Result]> {
        map { $0.compactMap(transform) }
    }
}
