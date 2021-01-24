//
//  BuildGroupServiceTests.swift
//  Raindrop
//
//  Created by Mikael Weiss on 1/23/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import XCTest
@testable import Raindrop

class BuildGroupServiceTests: XCTestCase {
    private var service: BuildGroupService!
    
    // MARK: - Setup
    
    override func setUp() {
        super.setUp()
        service = BuildGroup.Service()
    }
}

