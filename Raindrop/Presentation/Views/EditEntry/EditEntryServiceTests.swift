//
//  EditEntryServiceTests.swift
//  Raindrop
//
//  Created by Mikael Weiss on 11/20/20.
//  Copyright © 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import XCTest
@testable import Raindrop

class EditEntryServiceTests: XCTestCase {
    private var service: EditEntryService!
    
    // MARK: - Setup
    
    override func setUp() {
        super.setUp()
        service = EditEntry.Service()
    }
}

