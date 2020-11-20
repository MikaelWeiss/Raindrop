//
//  EditValueInteractorTests.swift
//  RaindropTests
//
//  Created by Mikael Weiss on 11/9/20.
//

import XCTest
@testable import Raindrop

class EditValueInteractorTests: XCTestCase {
    private var service: EditValueServiceDouble!
    private var presenter: EditValuePresenterDouble!
    private var interactor: EditValueInteractor!
    
    func testUpdateTheme() {
        // When
        interactor.updateTheme()
        
        // Then
        XCTAssertTrue(presenter.presentUpdateThemeCalled)
    }
    
    func testDidChangeValue() {
        // Given
        let request = EditValue.ValidateValue.Request(value: "Some new value")
        
        // When
        interactor.didChangeValue(with: request)
        
        // Then
        XCTAssertEqual(presenter.value, "Some new value")
    }
    
    func testPrepareRouteToFirstSheet() {
        // When
        interactor.prepareRouteToFirstSheet()
        
        // Then
        XCTAssertTrue(presenter.presentPrepareRouteToFirstSheetCalled)
    }
    
    func testPrepareRouteToSecondSheet() {
        // When
        interactor.prepareRouteToSecondSheet()
        
        // Then
        XCTAssertTrue(presenter.presentPrepareRouteToSecondSheetCalled)
    }
    
    func testPrepareRouteToOtherScene() {
        // When
        interactor.prepareRouteToOtherScene()
        
        // Then
        XCTAssertTrue(presenter.presentPrepareRouteToOtherSceneCalled)
    }
    
    // MARK: - Test Setup
    
    override func setUp() {
        super.setUp()
        service = EditValueServiceDouble()
        presenter = EditValuePresenterDouble()
        interactor = EditValueInteractor(service: service, presenter: presenter)
    }
    
    // MARK: - Test Doubles
    
    // Either class, or struct with mutating functions
    class EditValuePresenterDouble: EditValuePresenting {
        var value: String?
        var presentUpdateThemeCalled = false
        var presentPrepareRouteToFirstSheetCalled = false
        var presentPrepareRouteToSecondSheetCalled = false
        var presentPrepareRouteToOtherSceneCalled = false
        
        func presentDidChangeValue(with response: EditValue.ValidateValue.Response) {
            value = response.value
        }
        
        func presentUpdateTheme() {
            presentUpdateThemeCalled = true
        }
        
        func presentPrepareRouteToFirstSheet() {
            presentPrepareRouteToFirstSheetCalled = true
        }
        
        func presentPrepareRouteToSecondSheet() {
            presentPrepareRouteToSecondSheetCalled = true
        }
        
        func presentPrepareRouteToOtherScene() {
            presentPrepareRouteToOtherSceneCalled = true
        }
    }
    
    class EditValueServiceDouble: EditValueService {
    }
}
