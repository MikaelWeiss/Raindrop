//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import XCTest
@testable import ___PROJECTNAMEASIDENTIFIER___

class ___VARIABLE_sceneName___InteractorTests: XCTestCase {
    private var service: ___VARIABLE_sceneName___ServiceDouble!
    private var presenter: ___VARIABLE_sceneName___PresenterDouble!
    private var interactor: ___VARIABLE_sceneName___Interactor!
    
    func testUpdateTheme() {
        // When
        interactor.updateTheme()
        
        // Then
        XCTAssertTrue(presenter.presentUpdateThemeCalled)
    }
    
    func testDidChangeValue() {
        // Given
        let request = ___VARIABLE_sceneName___.ValidateValue.Request(value: "Some new value")
        
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
    
    func testPrepareRouteToOtherScene() {
        // When
        interactor.prepareRouteToOtherScene()
        
        // Then
        XCTAssertTrue(presenter.presentPrepareRouteToOtherSceneCalled)
    }
    
    // MARK: - Test Setup
    
    override func setUp() {
        super.setUp()
        service = ___VARIABLE_sceneName___ServiceDouble()
        presenter = ___VARIABLE_sceneName___PresenterDouble()
        interactor = ___VARIABLE_sceneName___Interactor(service: service, presenter: presenter)
    }
    
    // MARK: - Test Doubles
    
    // Either class, or struct with mutating functions
    class ___VARIABLE_sceneName___PresenterDouble: ___VARIABLE_sceneName___Presenting {
        var value: String?
        var presentUpdateThemeCalled = false
        var presentPrepareRouteToSheetCalled = false
        var presentPrepareRouteToOtherSceneCalled = false
        
        func presentDidChangeValue(with response: ___VARIABLE_sceneName___.ValidateValue.Response) {
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
    
    class ___VARIABLE_sceneName___ServiceDouble: ___VARIABLE_sceneName___Service {
    }
}
