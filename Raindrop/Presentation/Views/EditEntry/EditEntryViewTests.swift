//
//  EditEntryViewTests.swift
//  Raindrop
//
//  Created by Mikael Weiss on 11/20/20.
//  Copyright © 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import XCTest
@testable import Raindrop

class EditEntryViewTests: XCTestCase {
    private var interactor: EditEntryInteractorDouble!
    private var viewModel: EditEntry.ViewModel!
    private var view: EditEntryView!
    
    func testDidChangeTextValue() {
        // Given
        let id = UUID()
        
        // When
        view.didChangeTextValue(to: "Something New", withID: id)
        
        // Then
        XCTAssertEqual(interactor.textFieldRequest.newValue, "Something New")
        XCTAssertEqual(interactor.textFieldRequest.id, id)
    }
    
    func testdidChangeNumberEntryValue() {
        // Given
        let id = UUID()
        
        // When
        view.didChangeNumberEntryValue(to: "99_999_999", withID: id)
        
        // Then
        XCTAssertEqual(interactor.numberRequest.newValue, "99_999_999")
        XCTAssertEqual(interactor.numberRequest.id, id)
    }
    
    func testdidChangeDate() {
        // Given
        let date = Date.now
        let id = UUID()
        
        // When
        view.didChangeDate(to: date, withID: id)
        
        // Then
        XCTAssertEqual(interactor.dateRequest.newValue, date)
        XCTAssertEqual(interactor.dateRequest.id, id)
    }
    
    func testDidSelectChecklistItem() {
        // Given
        let checklistID = UUID()
        let itemID = UUID()
        
        // When
        view.didSelectChecklistItem(checklistID: checklistID, itemID: itemID)
        
        // Then
        XCTAssertEqual(interactor.checklistRequest.checklistID, checklistID)
        XCTAssertEqual(interactor.checklistRequest.checklistItemID, itemID)
    }
    
    func testDidSelectSelectionItem() {
        // Given
        let selectionID = UUID()
        let itemID = UUID()
        
        // When
        view.didSelectSelectionItem(selectionID: selectionID, itemID: itemID)
        
        // Then
        XCTAssertEqual(interactor.selectionRequest.selectionID, selectionID)
        XCTAssertEqual(interactor.selectionRequest.selectionItemID, itemID)
    }
    
    func testDidTapSave() {
        // When
        view.didTapSave()
        
        // Then
        XCTAssert(interactor.didTapSaveCalled)
    }
    
    // MARK: - Test Setup
    
    override func setUp() {
        super.setUp()
        interactor = EditEntryInteractorDouble()
        viewModel = EditEntry.ViewModel()
        view = EditEntryView(interactor: interactor, viewModel: viewModel)
    }
    
    // MARK: - Test Doubles
    
    class EditEntryInteractorDouble: EditEntryRequesting {
        var prepareRouteToOtherSceneCalled = false
        var prepareRouteToSheetCalled = false
        var checkCanSaveCalled = false
        var updateThemeCalled = false
        var fetchItemsCalled = false
        var didTapSaveCalled = false
        var textFieldRequest: EditEntry.ValidateTextEntryValue.Request!
        var numberRequest: EditEntry.ValidateNumberEntryValue.Request!
        var dateRequest: EditEntry.ValidateDateEntry.Request!
        var checklistRequest: EditEntry.ValidateChecklistSelection.Request!
        var selectionRequest: EditEntry.ValidateSelectionItemSelection.Request!
        
        func fetchItems() {
            fetchItemsCalled = true
        }
        
        func didChangeTextFieldValue(with request: EditEntry.ValidateTextEntryValue.Request) {
            textFieldRequest = request
        }
        
        func didChangeNumberEntryValue(with request: EditEntry.ValidateNumberEntryValue.Request) {
            numberRequest = request
        }
        
        func didChangeDate(with request: EditEntry.ValidateDateEntry.Request) {
            dateRequest = request
        }
        
        func didSelectChecklistItem(with request: EditEntry.ValidateChecklistSelection.Request) {
            checklistRequest = request
        }
        
        func didSelectSelectionItem(with request: EditEntry.ValidateSelectionItemSelection.Request) {
            selectionRequest = request
        }
        
        func checkCanSave() {
            checkCanSaveCalled = true
        }
        
        func didTapSave() {
            didTapSaveCalled = true
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
