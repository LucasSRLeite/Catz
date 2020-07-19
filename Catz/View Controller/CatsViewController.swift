//
//  ViewController.swift
//  Catz
//
//  Created by Lucas Leite on 17/07/20.
//  Copyright © 2020 Lucas Leite. All rights reserved.
//

import Combine
import CombineDataSources
import UIKit

final class CatsViewController: UIViewController {
    @IBOutlet private var collectionView: UICollectionView!

    private var viewModel = CatsViewModel()
    private var cancellables = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self

        viewModel.catModels
            .receive(on: DispatchQueue.main)
            .bind(subscriber: collectionView.itemsSubscriber(cellType: CatCollectionViewCell.self) { cell, _, viewModel in
                cell.viewModel = viewModel
            }).store(in: &cancellables)
    }
}

extension CatsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 100, height: 100)
    }
}
