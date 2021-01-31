//
//  BuildGroupViewTests.swift
//  Raindrop
//
//  Created by Mikael Weiss on 1/23/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import XCTest
@testable import Raindrop

class BuildGroupViewTests: XCTestCase {
    private var interactor: BuildGroupInteractorDouble!
    private var viewModel: BuildGroup.ViewModel!
    private var view: BuildGroupView!
    
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
    
    func testColorsNotNill() {
        XCTAssertNotNil(UIColor(named: "AccentColor"))
    }
    
    // MARK: - Test Setup
    
    override func setUp() {
        super.setUp()
        interactor = BuildGroupInteractorDouble()
        viewModel = BuildGroup.ViewModel()
        view = BuildGroupView(interactor: interactor, viewModel: viewModel)
    }
    
    // MARK: - Test Doubles
    
    class BuildGroupInteractorDouble: BuildGroupRequesting {
        var value: String?
        var updateThemeCalled = false
        var prepareRouteToSheetCalled = false
        var prepareRouteToOtherSceneCalled = false
        
        func didChangeValue(with request: BuildGroup.ValidateValue.Request) {
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
