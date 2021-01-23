////
////  EditEntryViewTests.swift
////  Raindrop
////
////  Created by Mikael Weiss on 11/20/20.
////  Copyright © 2020 ___ORGANIZATIONNAME___. All rights reserved.
////
//
//import XCTest
//@testable import Raindrop
//
//class EditEntryViewTests: XCTestCase {
//    private var interactor: EditEntryInteractorDouble!
//    private var viewModel: EditEntry.ViewModel!
//    private var view: EditEntryView!
//    
//    func testDidChangeValue() {
//        // When
//        view.didChangeValue(to: "Some Value")
//        
//        // Then
//        XCTAssertEqual(interactor.value, "Some Value")
//    }
//    
//    func testPrepareRouteToSheet() {
//        // When
//        view.prepareRouteToSheet()
//        
//        // Then
//        XCTAssertTrue(interactor.prepareRouteToSheetCalled)
//    }
//    
//    func testPrepareRouteToOtherScene() {
//        // When
//        view.prepareRouteToOtherScene()
//        
//        // Then
//        XCTAssertTrue(interactor.prepareRouteToOtherSceneCalled)
//    }
//    
//    // MARK: - Test Setup
//    
//    override func setUp() {
//        super.setUp()
//        interactor = EditEntryInteractorDouble()
//        viewModel = EditEntry.ViewModel()
//        view = EditEntryView(interactor: interactor, viewModel: viewModel)
//    }
//    
//    // MARK: - Test Doubles
//    
//    class EditEntryInteractorDouble: EditEntryRequesting {
//        var value: String?
//        var updateThemeCalled = false
//        var prepareRouteToSheetCalled = false
//        var prepareRouteToOtherSceneCalled = false
//        
//        func didChangeValue(with request: EditEntry.ValidateValue.Request) {
//            value = request.value
//        }
//        
//        func updateTheme() {
//            updateThemeCalled = true
//        }
//        
//        func prepareRouteToSheet() {
//            prepareRouteToSheetCalled = true
//        }
//        
//        func prepareRouteToOtherScene() {
//            prepareRouteToOtherSceneCalled = true
//        }
//    }
//}
