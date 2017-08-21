//
//  StringExtensionsTest.swift
//  GLChatTests
//
//  Created by Daniel on 17/8/17.
//  Copyright © 2017 Holmusk. All rights reserved.
//

import XCTest
@testable import GLChat

class StringExtensionsTest: XCTestCase {
    
    func test_GetInitialFromString_ShouldWork() {
        let source = ["John Applegate", "JeanCloud Van Damme", "蔡妍熙", "👽", "Kitty   Pride", ""]
        let expectedResults = ["JA", "JVD", "蔡", "👽", "KP", "",]
        let results = source.map({$0.initials})
        XCTAssertTrue(expectedResults == results)
    }
    
}
