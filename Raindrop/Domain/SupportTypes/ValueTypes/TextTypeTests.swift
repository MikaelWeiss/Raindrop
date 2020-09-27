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
        // When
        let textType = TextType()
        
        // Then
        XCTAssertNotNil(textType.id)
        XCTAssertEqual(textType.type, .text)
    }
    
    func testSetValue() {
        // Given
        var textType = TextType()
        let value = "SomeValue"
        
        // When
        textType.setValue(value)
        
        // Then
        XCTAssertEqual(textType.value, value)
    }
    
}
