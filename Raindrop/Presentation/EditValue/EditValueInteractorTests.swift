//
//  EditValueInteractorTests.swift
//  RaindropTests
//
//  Created by Mikael Weiss on 11/9/20.
//

import XCTest
@testable import Raindrop

class EditValueInteractorTests: XCTestCase {
    private var presenter: EditValuePresenterDouble!
    private var service: EditValueServiceDouble!
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
    
    func testPrepareRouteToSheet() {
        // When
        interactor.prepareRouteToSheet()
        
        // Then
        XCTAssertTrue(presenter.presentPrepareRouteToSheetCalled)
    }
    
    func tesetPrepareRouteToOtherScene() {
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
        var presentPrepareRouteToSheetCalled = false
        var presentPrepareRouteToOtherSceneCalled = false
        
        func presentDidChangeValue(with response: EditValue.ValidateValue.Response) {
            value = response.value
        }
        
        func presentUpdateTheme() {
            presentUpdateThemeCalled = true
        }
        
        func presentPrepareRouteToSheet() {
            presentPrepareRouteToSheetCalled = true
        }
        
        func presentPrepareRouteToOtherScene() {
            presentPrepareRouteToOtherSceneCalled = true
        }
    }
    
    class EditValueServiceDouble: EditValueService {
    }
}
