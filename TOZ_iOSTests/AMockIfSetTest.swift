//
//  AMockIfSetTest.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import XCTest
@testable import TOZ_iOS

class AMockIfSetTest: XCTestCase {

    var serviceOperation: ServiceOperation?

    override func setUp() {
        serviceOperation = ServiceOperation()
    }

    func testAddScheduleResponse() {
        XCTAssert(type(of: serviceOperation?.service.service) == NetworkService?.self, "The application is in Mock mode")
    }

}
