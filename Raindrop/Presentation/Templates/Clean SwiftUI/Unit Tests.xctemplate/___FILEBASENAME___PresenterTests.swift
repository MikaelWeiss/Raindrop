//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import XCTest
@testable import ___PROJECTNAMEASIDENTIFIER___

class ___VARIABLE_sceneName___PresenterTests: XCTestCase {
    private var presenter: ___VARIABLE_sceneName___Presenter!
    private var viewModel: ___VARIABLE_sceneName___.ViewModel!
    
    func testPresentUpdateTheme() {
        // When
        presenter.presentUpdateTheme()
        
        // Then
        XCTAssertEqual(viewModel.title, ___VARIABLE_sceneName___.Strings.sceneTitle)
        XCTAssertEqual(viewModel.textFieldTitle, ___VARIABLE_sceneName___.Strings.textFieldTitle)
    }
    
    func testPresentDidChangeValue() {
        // Given
        let response = ___VARIABLE_sceneName___.ValidateValue.Response(value: "Some value")
        
        // When
        presenter.presentDidChangeValue(with: response)
        
        // Then
        XCTAssertEqual(viewModel.textFieldValue, "Some value")
    }
    
    func testPresentPrepareRouteToSheet() {
        // When
        presenter.presentPrepareRouteToSheet()
        
        // Then
        XCTAssertTrue(viewModel.isShowingSheet)
    }
    
    func testPresentPrepareRouteToOtherScene() {
        // When
        presenter.presentPrepareRouteToOtherScene()
        
        // Then
        XCTAssertTrue(viewModel.isShowingOtherScene)
    }
    
    // MARK: - Test Setup
    
    override func setUp() {
        super.setUp()
        presenter = ___VARIABLE_sceneName___Presenter()
        viewModel = presenter.viewModel
    }
}



