//
//  RadioSaiAudioPlayerTests.swift
//  RadioSaiAudioPlayerTests
//
//  Created by Rajesh Shah on 29/07/2017.
//  Copyright © 2017 Rajesh Shah. All rights reserved.
//

import XCTest
@testable import RadioSaiAudioPlayer

class RadioSaiAudioPlayerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testAudioItemCreation() {
        let a = AudioItem.init(id: 1, date: "some-date", title: "some-title", url: "some-url")
        XCTAssert(a.id == 1)
    }
}
