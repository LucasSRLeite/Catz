//
//  ImageCacheHandler.swift
//  Catz
//
//  Created by Lucas Leite on 18/07/20.
//  Copyright © 2020 Lucas Leite. All rights reserved.
//

import UIKit

struct ImageCacheHandler {
    static let shared = ImageCacheHandler()

    let cache = NSCache<NSString, UIImage>()

    func setImage(_ image: UIImage, for key: String) {
        let cacheKey = NSString(string: key)
        cache.setObject(image, forKey: cacheKey)
    }

    func image(for key: String) -> UIImage? {
        let cacheKey = NSString(string: key)
        return cache.object(forKey: cacheKey)
    }
}
