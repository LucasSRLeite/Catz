//
//  CatsViewModelTests.swift
//  CatsViewModelTests
//
//  Created by Lucas Leite on 17/07/20.
//  Copyright © 2020 Lucas Leite. All rights reserved.
//

@testable import Catz
import Combine
import XCTest

final class CatsViewModelTests: XCTestCase {
    var repository: CatsRepositoryProtocol!
    var viewModel: CatsViewModel!
    var cancellables: Set<AnyCancellable>!

    override func setUp() {
        super.setUp()

        repository = CatsRepositoryMock()
        viewModel = CatsViewModel(repository: repository)
        cancellables = Set<AnyCancellable>()
    }

    override func tearDown() {
        repository = nil
        viewModel = nil
        cancellables = nil

        super.tearDown()
    }

    func test_catImages_filtersAllImagesCorrectly() {
        let testExpectation = expectation(description: #function)

        viewModel.catModels
            .sink { models in
                XCTAssertEqual(models.count, 5)
                testExpectation.fulfill()
            }
            .store(in: &cancellables)

        wait(for: [testExpectation], timeout: 1)
    }
}
