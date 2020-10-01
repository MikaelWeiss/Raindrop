//
//  TextTypeTests.swift
//  RaindropTests
//
//  Created by Mikael Weiss on 9/27/20.
//

@testable import Raindrop
import XCTest

class TextTypeTests: XCTestCase {
    func testInit() {
        // Given
        let value = "SomeValue"
        
        // When
        let textType = TextType(value)
        
        // Then
        XCTAssertEqual(textType.value, value)
    }
    
    func testSetValue() {
        // Given
        var textType = TextType("SomeValue")
        let value = "SomeNewValue"
        
        // When
        textType.setValue(value)
        
        // Then
        XCTAssertEqual(textType.value, value)
    }
}
