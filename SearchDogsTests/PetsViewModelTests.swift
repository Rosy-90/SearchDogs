//
//  SearchDogsTests.swift
//  SearchDogsTests
//
//  Created by Rosy Patel on 28/04/2022.
//

import XCTest
@testable import SearchDogs

class PetsViewModelTests: XCTestCase {
    var mockService: MockService!
    var viewModel: PetsViewModel!

    override func setUp() {
        mockService = MockService()
        let vc = PetsViewController()
        viewModel = PetsViewModel(delegate: vc, service: mockService)
    }
    
    func testSearchSuccess() {
        mockService.responseFileName =  "ItemsSuccessResponse"
        viewModel.searchPetInfo(for: "ab")
        let resultCount = viewModel.itemCount
        XCTAssertEqual(resultCount, 2, "Pets Search count not matching")
    }
    
    func testSearchFailure() {
        mockService.responseFileName =  "ItemFailureResponse"
        viewModel.searchPetInfo(for: "ab")
        let resultCount = viewModel.itemCount
        print(resultCount)
        XCTAssertEqual(resultCount, 0, "Pets Search count not matching")
    }
    
    func testEmptyTextSearch() {
        mockService.responseFileName =  "ItemsSuccessResponse"
        viewModel.searchPetInfo(for: "")
        let resultCount = viewModel.itemCount
        XCTAssertEqual(resultCount, 0, "Pets Search count not matching")
    }
    
    func testGetBreedNameAndImageId() {
        mockService.responseFileName =  "ItemsSuccessResponse"
        viewModel.searchPetInfo(for: "ab")
        var petDetails = viewModel.getBreedNameAndImageId(for: 1)
        
        XCTAssertEqual(petDetails.imageName ,"https://cdn2.thedogapi.com/images/B1uW7l5VX.jpg", "Pet Image URL not matching")
        XCTAssertEqual(petDetails.breadName, "Labrador Retriever", "Pet Name not matching")
        
        petDetails = viewModel.getBreedNameAndImageId(for: -1)
        XCTAssertEqual(petDetails.imageName ,"", "Pet Image URL not matching")
        XCTAssertEqual(petDetails.breadName ,"", "Pet Name not matching")
    }

    func testGetPetDetails() {
        mockService.responseFileName = "ItemsSuccessResponse"
        viewModel.searchPetInfo(for: "ab")
        var  petDetails = viewModel.getPetDetails(for: 1)
        
        XCTAssertEqual(petDetails.breadName, "Labrador Retriever", "Pet Name not matching")
        XCTAssertEqual(petDetails.height, "21.5 - 24.5 - 55 - 62", "Pet height not matching")
        XCTAssertEqual(petDetails.weight, "55 - 80 - 25 - 36", "Pet weight not matching")
        XCTAssertEqual(petDetails.lifeSpan, "10 - 13 years", "Pet lifeSpan not matching")
        XCTAssertEqual(petDetails.temperament, "Kind, Outgoing, Agile, Gentle, Intelligent, Trusting, Even Tempered", "Pet temperamentnot matching")

        petDetails = viewModel.getPetDetails(for: -1)
        
        XCTAssertEqual(petDetails.breadName, "", "Pet Name not matching")
        XCTAssertEqual(petDetails.height, "", "Pet height not matching")
        XCTAssertEqual(petDetails.weight, "", "Pet weight not matching")
        XCTAssertEqual(petDetails.lifeSpan, "", "Pet lifeSpan not matching")
        XCTAssertEqual(petDetails.temperament, "", "Pet temperamentnot matching")
    }
}
