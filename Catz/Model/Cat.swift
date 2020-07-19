//
//  Cat.swift
//  Catz
//
//  Created by Lucas Leite on 17/07/20.
//  Copyright © 2020 Lucas Leite. All rights reserved.
//

import Foundation

struct Cat: Decodable, Hashable {
    let id: String
    let title: String
    let images: [CatImage]?

    var imageLinks: [String] {
        images?.compactMap { $0.link }.filter { $0.contains(".jpg") } ?? []
    }
}
