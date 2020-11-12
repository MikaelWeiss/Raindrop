//
//  EditValuePresenterTests.swift
//  RaindropTests
//
//  Created by Mikael Weiss on 11/9/20.
//

import XCTest
@testable import Raindrop

class EditValuePresenterTests: XCTestCase {
    private var presenter: EditValuePresenter!
    private var viewModel: EditValue.ViewModel!
    
    func testPresentUpdateTheme() {
        // When
        presenter.presentUpdateTheme()
        
        // Then
        XCTAssertEqual(viewModel.title, EditValue.Strings.sceneTitle)
        XCTAssertEqual(viewModel.textFieldTitle, EditValue.Strings.textFieldTitle)
        XCTAssertEqual(viewModel.sheetButtonTitle, EditValue.Strings.sheetButtonTitle)
        XCTAssertEqual(viewModel.navigationLinkButtonTitle, EditValue.Strings.navigationLinkButtonTitle)
    }
    
    func testPresentDidChangeValue() {
        // Given
        let response = EditValue.ValidateValue.Response(value: "Some value")
        
        // When
        presenter.presentDidChangeValue(with: response)
        
        // Then
        XCTAssertEqual(viewModel.textFieldValue, "Some value")
    }
    
    func testPresentPrepareRouteToFirstSheet() {
        // When
        presenter.presentPrepareRouteToFirstSheet()
        
        // Then
        XCTAssertTrue(viewModel.isShowingFirstSheet)
    }
    
    func testPresentPrepareRouteToSecondSheet() {
        // When
        presenter.presentPrepareRouteToSecondSheet()
        
        // Then
        XCTAssertTrue(viewModel.isShowingSecondSheet)
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
        presenter = EditValuePresenter()
        viewModel = presenter.viewModel
    }
}
