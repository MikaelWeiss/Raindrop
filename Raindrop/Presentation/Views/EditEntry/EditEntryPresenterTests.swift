//
//  EditEntryPresenterTests.swift
//  Raindrop
//
//  Created by Mikael Weiss on 11/20/20.
//  Copyright © 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import XCTest
@testable import Raindrop

class EditEntryPresenterTests: XCTestCase {
    private var presenter: EditEntryPresenter!
    private var viewModel: EditEntry.ViewModel!
    
    func testPresentUpdateTheme() {
    }
    
    func testPresentFetchItems() {
        // Given    
        let response = EditEntry.FetchItems.Response(items: [Item(title: "Some item", type: .text(""))])
        
        // When
        presenter.presentFetchItems(with: response)
        
        // Then
        XCTAssertEqual(viewModel.entryItems, response.items)
    }
    
    func testPresentUpdateItem() throws {
        // Given
        var item = Item(title: "Some title", type: .text("Some String"))
        viewModel.entryItems.append(item)
        item.type = .text("Something new")
        let response = EditEntry.ValidateItem.Response(item: item)
        
        // When
        presenter.presentUpdateItem(with: response)
        
        // Then
        XCTAssertEqual(viewModel.entryItems.first?.title, "Some title")
        XCTAssertEqual(viewModel.entryItems.first?.id, item.id)
        if case let .text(value) = viewModel.entryItems.first?.type {
            XCTAssertEqual(value, "Something new")
        } else {
            throw TestError.error
        }
    }
    
    func testPresentUpdateItemThrows() {
        // Given
        let response = EditEntry.ValidateItem.Response(item: Item(title: "Some title", type: .text("Some String")))
        
        // When
        presenter.presentUpdateItem(with: response)
        
        // Then
        XCTAssertTrue(viewModel.showError)
    }
    
    func testPresentErrorIvalidFormat() {
        // Given
        let error = EditEntry.ServiceError.invalidFormat
        
        // When
        presenter.presentError(error)
        
        // Then
        XCTAssertEqual(viewModel.errorMessage, EditEntry.Strings.defaultErrorMessage)
    }
    
    func testPresentErrorDefaultErrorMessage() {
        // Given
        let error = TestError.error
        
        // When
        presenter.presentError(error)
        
        // Then
        XCTAssertEqual(viewModel.errorMessage, EditEntry.Strings.defaultErrorMessage)
    }
    
    // MARK: - Test Setup
    
    override func setUp() {
        super.setUp()
        presenter = EditEntryPresenter()
        viewModel = presenter.viewModel
    }
}
