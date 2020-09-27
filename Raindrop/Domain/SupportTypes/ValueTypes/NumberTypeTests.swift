//
//  NumberTypeTests.swift
//  RaindropTests
//
//  Created by Mikael Weiss on 9/27/20.
//

@testable import Raindrop
import XCTest

class NumberTypeTests: XCTestCase {
    
    func testInit() {
        // Given
        let value: Decimal = 2784
        
        // When
        let number = Number(value)
        
        // Then
        XCTAssertNotNil(number.id)
        XCTAssertEqual(number.type, .text)
        XCTAssertEqual(number.value, value)
    }
    
    func testSetValue() {
        // Given
        var number = Number(0)
        let value: Decimal = 87654
        
        // When
        number.setValue(value)
        
        // Then
        XCTAssertEqual(number.value, value)
    }
}
