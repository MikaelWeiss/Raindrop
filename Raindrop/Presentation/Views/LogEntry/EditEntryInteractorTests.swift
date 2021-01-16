//
//  EditEntryInteractorTests.swift
//  Raindrop
//
//  Created by Mikael Weiss on 11/20/20.
//  Copyright © 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import XCTest
@testable import Raindrop

class EditEntryInteractorTests: XCTestCase {
    private var service: EditEntryServiceDouble!
    private var presenter: EditEntryPresenterDouble!
    private var interactor: EditEntryInteractor!
    
    func testUpdateTheme() {
        // When
        interactor.updateTheme()
        
        // Then
        XCTAssertTrue(presenter.presentUpdateThemeCalled)
    }
    
    func testFetchItems() {
        // Given
        let items = [Item(title: "Some title", type: .text(""))]
        service.items = items
        
        // When
        interactor.fetchItems()
        
        // Then
        XCTAssertTrue(service.items == items)
        XCTAssertTrue(presenter.presentFetchItemsResponse.items == items)
    }
    
    func testDidChangeTextFieldValue() throws {
        // Given
        let item = Item(title: "Some Title", type: .text("A cool value 😎"))
        service.validateTextFieldInputItem = item
        let request = EditEntry.ValidateTextEntryValue.Request(newValue: "Some other value", id: item.id)
        
        // When
        interactor.didChangeTextFieldValue(with: request)
        
        // Then
        XCTAssertEqual(presenter.presentUpdateItemResponse.item.title, "Some Title")
        XCTAssertEqual(presenter.presentUpdateItemResponse.item.id, item.id)
        XCTAssertEqual(service.validateTextFieldInputSpy?.input, "Some other value")
        XCTAssertEqual(service.validateTextFieldInputSpy?.id, item.id)
        if case .text(let value) = presenter.presentUpdateItemResponse.item.type {
            XCTAssertEqual(value, "A cool value 😎")
        } else {
            throw TestError.error
        }
    }
    
    func testDidChangeTextFieldValueCatchesError() {
        // Given
        service.validateTextFieldInputError = TestError.error
        let request = EditEntry.ValidateTextEntryValue.Request(newValue: "Some other value", id: UUID())
        
        // When
        interactor.didChangeTextFieldValue(with: request)
        
        // Then
        XCTAssertEqual(presenter.presentErrorError, .error)
    }
    
    func testDidChangeNumberEntryValue() throws {
        // Given
        let item = Item(title: "Some Title", type: .number("A cool value 😎"))
        service.validateNumberInputItem = item
        let request = EditEntry.ValidateNumberEntryValue.Request(newValue: "Some other value", id: item.id)
        
        // When
        interactor.didChangeNumberEntryValue(with: request)
        
        // Then
        XCTAssertEqual(presenter.presentUpdateItemResponse.item.title, "Some Title")
        XCTAssertEqual(presenter.presentUpdateItemResponse.item.id, item.id)
        XCTAssertEqual(service.validateNumberInputSpy?.input, "Some other value")
        XCTAssertEqual(service.validateNumberInputSpy?.id, item.id)
        if case .number(let value) = presenter.presentUpdateItemResponse.item.type {
            XCTAssertEqual(value, "A cool value 😎")
        } else {
            throw TestError.error
        }
    }
    
    func testDidChangeNumberEntryValueCatchesError() {
        // Given
        service.validateNumberInputError = TestError.error
        let request = EditEntry.ValidateNumberEntryValue.Request(newValue: "Some other value", id: UUID())
        
        // When
        interactor.didChangeNumberEntryValue(with: request)
        
        // Then
        XCTAssertEqual(presenter.presentErrorError, .error)
    }
    
    func testDidChangeDate() throws {
        // Given
        let firstDate = Date.today
        let secondDate = firstDate.addingTimeInterval(60)
        let item = Item(title: "Some Title", type: .date(firstDate))
        service.validateDateInputItem = item
        let request = EditEntry.ValidateDateEntry.Request(newValue: secondDate, id: item.id)
        
        // When
        interactor.didChangeDate(with: request)
        
        // Then
        XCTAssertEqual(presenter.presentUpdateItemResponse.item.title, "Some Title")
        XCTAssertEqual(presenter.presentUpdateItemResponse.item.id, item.id)
        XCTAssertEqual(service.validateDateInputSpy?.input, secondDate)
        XCTAssertEqual(service.validateDateInputSpy?.id, item.id)
        if case .date(let value) = presenter.presentUpdateItemResponse.item.type {
            XCTAssertEqual(value, firstDate)
        } else {
            throw TestError.error
        }
    }
    
    // MARK: - Test Setup
    
    override func setUp() {
        super.setUp()
        service = EditEntryServiceDouble()
        presenter = EditEntryPresenterDouble()
        interactor = EditEntryInteractor(service: service, presenter: presenter)
    }
    
    // MARK: - Test Doubles
    
    // Either class, or struct with mutating functions
    class EditEntryPresenterDouble: EditEntryPresenting {
        var presentUpdateThemeCalled = false
        var presentDidTapSaveCalled = false
        var presentFetchItemsResponse: EditEntry.FetchItems.Response!
        var presentUpdateItemResponse: EditEntry.ValidateItem.Response!
        var presentErrorError: TestError?
        var presentCheckCanSaveResponse: EditEntry.CheckCanSave.Response!
        
        func presentUpdateTheme() {
            presentUpdateThemeCalled = true
        }
        
        func presentFetchItems(with response: EditEntry.FetchItems.Response) {
            presentFetchItemsResponse = response
        }
        
        func presentUpdateItem(with response: EditEntry.ValidateItem.Response) {
            presentUpdateItemResponse = response
        }
        
        func presentError(_ error: Error) {
            presentErrorError = error as? TestError
        }
        
        func presentDidTapSave() {
            presentDidTapSaveCalled = true
        }
        
        func presentCheckCanSave(with response: EditEntry.CheckCanSave.Response) {
            presentCheckCanSaveResponse = response
        }
        
    }
    
    class EditEntryServiceDouble: EditEntryService {
        var items: [Item]!
        var validateTextFieldInputItem: Item!
        var validateTextFieldInputError: TestError?
        var validateTextFieldInputSpy: (input: String, id: UUID)?
        var validateNumberInputItem: Item!
        var validateNumberInputError: TestError?
        var validateNumberInputSpy: (input: String, id: UUID)?
        var validateDateInputItem: Item!
        var validateDateInputError: TestError?
        var validateDateInputSpy: (input: Date, id: UUID)?
        var validateChecklistInputItem: Item!
        var validateChecklistInputError: TestError?
        var validateChecklistInputSpy: (checklistID: UUID, checklistItemID: UUID)?
        var validateSelectionInputItem: Item!
        var validateSelectionInputError: TestError?
        var validateSelectionInputSpy: (selectionID: UUID, selectionItemID: UUID)?
        var saveConditionMet: Bool!
        var saveError: TestError?
        
        var saveCalled = false
        
        func fetchItems() -> [Item] {
            return items
        }
        
        func validateTextFieldInput(_ input: String, id: UUID) throws -> Item {
            validateTextFieldInputSpy = (input: input, id: id)
            if let error = validateTextFieldInputError {
                throw error
            } else {
                return validateTextFieldInputItem
            }
        }
        
        func validateNumberInput(_ input: String, id: UUID) throws -> Item {
            validateNumberInputSpy = (input: input, id: id)
            if let error = validateNumberInputError {
                throw error
            } else {
                return validateNumberInputItem
            }
        }
        
        func validateDateInput(_ input: Date, id: UUID) throws -> Item {
            validateDateInputSpy = (input: input, id: id)
            if let error = validateDateInputError {
                throw error
            } else {
                return validateDateInputItem
            }
        }
        
        func validateChecklistInput(checklistID: UUID, checklistItemID: UUID) throws -> Item {
            validateChecklistInputSpy = (checklistID: checklistID, checklistItemID: checklistItemID)
            if let error = validateChecklistInputError {
                throw error
            } else {
                return validateChecklistInputItem
            }
        }
        
        func validateSelectionInput(selectionID: UUID, selectionItemID: UUID) throws -> Item {
            validateSelectionInputSpy = (selectionID: selectionID, selectionItemID: selectionItemID)
            if let error = validateSelectionInputError {
                throw error
            } else {
                return validateSelectionInputItem
            }
        }
        
        func canSave() -> Bool {
            return saveConditionMet
        }
        
        func save() throws {
            saveCalled = true
            if let error = saveError {
                throw error
            }
        }
    }
}
