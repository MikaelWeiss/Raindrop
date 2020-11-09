//
//  EditValueServiceTests.swift
//  RaindropTests
//
//  Created by Mikael Weiss on 11/9/20.
//

import XCTest
@testable import Raindrop

class EditValueServiceTests: XCTestCase {
    private var service: EditValueService!
    
    // MARK: - Setup
    
    override func setUp() {
        super.setUp()
        service = EditValue.Service()
    }
}
