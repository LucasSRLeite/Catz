//
//  CatImageViewModelTests.swift
//  CatzTests
//
//  Created by Lucas Leite on 20/07/20.
//  Copyright © 2020 Lucas Leite. All rights reserved.
//

@testable import Catz
import Combine
import XCTest

final class CatImageViewModelTests: XCTestCase {

    var catImage: CatImage!
    var repository: CatImageRepositoryProtocol!
    var viewModel: CatImageViewModel!
    var cancellables: Set<AnyCancellable>!

    override func setUp() {
        super.setUp()

        catImage = CatImage(id: "1", link: "Link 1", type: "image/jpeg")
        repository = CatImageRepositoryMock()
        viewModel = CatImageViewModel(catImage: catImage, repository: repository)
        cancellables = Set<AnyCancellable>()
    }

    override func tearDown() {
        catImage = nil
        repository = nil
        viewModel = nil
        cancellables = nil

        super.tearDown()
    }

    func test_isRequesting_isUpdatingCorrectly() {
        let testExpectation = expectation(description: #function)
        let expectedResult = [true, false]
        var actualResult: [Bool] = []

        viewModel.image
            .sink { _ in }
            .store(in: &cancellables)
        
        viewModel.isRequesting
            .sink { value in
                actualResult.append(value)
                if actualResult.count == expectedResult.count {
                    testExpectation.fulfill()
                }
            }
            .store(in: &cancellables)

        wait(for: [testExpectation], timeout: 1)

        XCTAssertEqual(actualResult, expectedResult)
    }
}
