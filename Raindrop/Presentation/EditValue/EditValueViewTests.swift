//
//  EditValueViewTests.swift
//  RaindropTests
//
//  Created by Mikael Weiss on 11/9/20.
//

import XCTest
@testable import Raindrop

class EditValueViewTests: XCTestCase {
    private var view: EditValueView!
    private var interactor: EditValueInteractorDouble!
    private var viewModel: EditValue.ViewModel!
    
    func testUpdateThemeCalled() {
        // Then
        XCTAssertTrue(interactor.updateThemeCalled)
    }
    
    func testDidChangeValue() {
        // When
        view.didChangeValue(to: "Some Value")
        
        // Then
        XCTAssertEqual(interactor.value, "Some Value")
    }
    
    func testPrepareRouteToSheet() {
        // When
        view.prepareRouteToSheet()
        
        // Then
        XCTAssertTrue(interactor.prepareRouteToSheetCalled)
    }
    
    func testPrepareRouteToOtherScene() {
        // When
        view.prepareRouteToOtherScene()
        
        // Then
        XCTAssertTrue(interactor.prepareRouteToOtherSceneCalled)
    }
    
    // MARK: - Test Setup
    
    override func setUp() {
        super.setUp()
        interactor = EditValueInteractorDouble()
        viewModel = EditValue.ViewModel()
        view = EditValueView(interactor: interactor, viewModel: viewModel)
    }
    
    // MARK: - Test Doubles
    
    class EditValueInteractorDouble: EditValueRequesting {
        var value: String?
        var updateThemeCalled = false
        var prepareRouteToSheetCalled = false
        var prepareRouteToOtherSceneCalled = false
        
        func didChangeValue(with request: EditValue.ValidateValue.Request) {
            value = request.value
        }
        
        func updateTheme() {
            updateThemeCalled = true
        }
        
        func prepareRouteToSheet() {
            prepareRouteToSheetCalled = true
        }
        
        func prepareRouteToOtherScene() {
            prepareRouteToOtherSceneCalled = true
        }
        
    }
}
