//
//  UICollectionView+CombineDataSources.swift
//  Catz
//
//  Created by Lucas Leite on 17/07/20.
//  Copyright © 2020 Lucas Leite. All rights reserved.
//

import Combine
import CombineDataSources
import UIKit

extension UICollectionView {
    func itemsSubscriber<CellType, Items>(cellType: CellType.Type, cellConfig: @escaping CollectionViewItemsController<[Items]>.CellConfig<Items.Element, CellType>) -> AnySubscriber<Items, Never> where CellType: UICollectionViewCell, Items: RandomAccessCollection, Items: Equatable {
        itemsSubscriber(cellIdentifier: String(describing: cellType), cellType: cellType, cellConfig: cellConfig)
    }

    func register(cellClass: AnyClass) {
        register(cellClass, forCellWithReuseIdentifier: String(describing: cellClass))
    }
}
