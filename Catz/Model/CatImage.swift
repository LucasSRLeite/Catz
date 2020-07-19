//
//  Image.swift
//  Catz
//
//  Created by Lucas Leite on 17/07/20.
//  Copyright © 2020 Lucas Leite. All rights reserved.
//

import Foundation

struct CatImage: Decodable, Hashable {
    let id: String
    let link: String
    let type: String

    var isImage: Bool {
        type.contains("image")
    }
}
