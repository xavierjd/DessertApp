//
//  DessertAppTests.swift
//  DessertAppTests
//
//  Created by xavier on 24/08/23.
//

import XCTest
import Combine
@testable import DessertApp

//Naming Structure: test_UnitOfWork_StateUnderTest_ExpextedBehavior
//Testing Structure: Given, When, Then

final class DessertAppTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_UnitTestingDessertDetailModel_isIngredient_True() {
        // Given
        let mockDessertDetailData = MockDessertDetailData.testData
        // When
        let ingredient = mockDessertDetailData.meals.first?.ingredientsList[0]
        // Then
        XCTAssertNotNil(ingredient?.ingredient)
    }
    
    func test_UnitTestingDessertDetailModel_isNotIngredient_True() {
        // Given
        let mockDessertDetailData = MockDessertDetailData.testData
        // When
        let ingredient = mockDessertDetailData.meals.first?.ingredientsList[10]
        // Then
        XCTAssertNil(ingredient?.ingredient)
    }
    
    func test_UnitDessertListViewModel_loadDesserts_shouldReturnDesserts() {
        // Given
        let dessertDataService = DessertDataService()
        let expectation = XCTestExpectation(description: "Should return after 5 s")
        var cancellables = Set<AnyCancellable>()
        // When
        let vm = DessertListViewModel(networkService: dessertDataService)
        vm.$desserts
            .dropFirst()
            .sink { returnedItems in
                expectation.fulfill()
            }.store(in: &cancellables)
        
        wait(for: [expectation], timeout: 10)
        //Then
        guard let dessertArray = vm.desserts?.meals else {
            XCTFail()
            return
        }
        XCTAssertGreaterThan(dessertArray.count, 0)
    }
    
    func test_UnitDessertDetailViewModel_loadDessertDetails_shouldReturnDessertsDetails() {
        // Given
        let expectation = XCTestExpectation(description: "Should return after 5 s")
        var cancellables = Set<AnyCancellable>()
        let dessert = DessertData(
            id: "53049",
            name: "Apam balik",
            imageUrl: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg")
        let networkService = DessertDetailService()
        // When
        let vm = DessertDetailViewModel(dessert: dessert, networkService: networkService)
        vm.$dessertDetails
            .dropFirst()
            .sink { returnedItems in
                expectation.fulfill()
            }.store(in: &cancellables)
        
        wait(for: [expectation], timeout: 10)
        //Then
        guard let dessertArray = vm.dessertDetails?.meals else {
            XCTFail()
            return
        }
        XCTAssertGreaterThan(dessertArray.count, 0)
    }
    
    func test_UnitDessertImageViewModel_loadImage_shouldReturnDessertsImage() async {
        // Given
        let dessert = DessertData(
            id: "53049",
            name: "Apam balik",
            imageUrl: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg")
        let dessertImage = DessertImageService()
        
        let imageFileManager = ImageFileManager()
        
        let vm = DessertImageViewModel(
            dessert: dessert,
            networkService: dessertImage,
            imageFileManager: imageFileManager)
        
        // When
        await vm.retrieveImage()
        
        //Then
        XCTAssertNotNil(vm.dessertImage)
    }
}
