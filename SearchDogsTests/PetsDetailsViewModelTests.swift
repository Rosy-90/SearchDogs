//
//  PetsDetailsViewModelTests.swift
//  SearchDogsTests
//
//  Created by Rosy Patel on 29/04/2022.
//

import XCTest
@testable import SearchDogs

class PetsDetailsViewModelTests: XCTestCase {

    var viewModel: PetDetailsViewModel!
    
    override func setUp() {
        viewModel = PetDetailsViewModel(petDetails: ("Labrador Retriever",
                                                     "21.5 - 24.5 - 55 - 62",
                                                     "55 - 80 - 25 - 36",
                                                     "10 - 13 years",
                                                     "Kind, Outgoing, Agile, Gentle, Intelligent, Trusting, Even Tempered"))
    }

    func testPetsDetails() {
        XCTAssertEqual(viewModel.breadName, "Labrador Retriever", "Pet Name not matching")
        XCTAssertEqual(viewModel.height, "21.5 - 24.5 - 55 - 62", "Pet height not matching")
        XCTAssertEqual(viewModel.weight ,"55 - 80 - 25 - 36", "Pet weight not matching")
        XCTAssertEqual(viewModel.lifeSpan ,"10 - 13 years", "Pet lifeSpan not matching")
        XCTAssertEqual(viewModel.temperament ,"Kind, Outgoing, Agile, Gentle, Intelligent, Trusting, Even Tempered", "Pet temperamentnot matching")
    }
}
