//
//  API.swift
//  Catz
//
//  Created by Lucas Leite on 17/07/20.
//  Copyright © 2020 Lucas Leite. All rights reserved.
//

import Foundation

enum API: String {
    case id
    case secret
    case url

    var value: String {
        guard let path = Bundle.main.path(forResource: "API", ofType: "plist"),
            let configDictionary = NSDictionary(contentsOfFile: path),
            let value = configDictionary.value(forKey: rawValue) as? String else {
            return ""
        }

        return value
    }
}
