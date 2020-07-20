//
//  CatCollectionViewCell.swift
//  Catz
//
//  Created by Lucas Leite on 17/07/20.
//  Copyright © 2020 Lucas Leite. All rights reserved.
//

import Combine
import UIKit

final class CatCollectionViewCell: UICollectionViewCell {
    @IBOutlet private var catImageView: UIImageView!
    @IBOutlet private var activityIndicator: UIActivityIndicatorView!

    var viewModel: CatImageViewModel! {
        didSet {
            setupBindings()
        }
    }

    private var cancellables = Set<AnyCancellable>()

    override func prepareForReuse() {
        super.prepareForReuse()

        catImageView.image = nil

        cancellables.forEach { $0.cancel() }
    }

    private func setupBindings() {
        viewModel.image
            .receive(on: DispatchQueue.main)
            .assign(to: \.image, on: catImageView)
            .store(in: &cancellables)

        viewModel.isRequesting
            .map(!)
            .receive(on: DispatchQueue.main)
            .assign(to: \.isHidden, on: activityIndicator)
            .store(in: &cancellables)
    }
}
