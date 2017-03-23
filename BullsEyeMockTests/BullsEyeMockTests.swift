//
//  BullsEyeMockTests.swift
//  BullsEyeMockTests
//
//  Created by Jeremy Broutin on 3/23/17.
//  Copyright © 2017 Ray Wenderlich. All rights reserved.
//

import XCTest
@testable import BullsEye

class MockUserDefaults: UserDefaults {
	var gameStyleChanged = 0
	override func set(_ value: Int, forKey defaultName: String) {
		if defaultName == "gameStyle"{
			gameStyleChanged += 1
		}
	}
}

	class BullsEyeMockTests: XCTestCase {
		
		var controllerUnderTest: ViewController!
		var mockUserDefaults: MockUserDefaults!
		
		override func setUp() {
			super.setUp()
			// Create SUT and mock object and inject mock object as a property of the SUT
			controllerUnderTest = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as! ViewController
			mockUserDefaults = MockUserDefaults(suiteName: "testing")!
			controllerUnderTest.defaults = mockUserDefaults
		}
		
		override func tearDown() {
			controllerUnderTest = nil
			mockUserDefaults = nil
			super.tearDown()
		}
		
		// Mock to test interaction with UserDefaults
		func testGameStyleCanBeChanged(){
			// Given...
			let segmentedControl = UISegmentedControl()
			// When...
			XCTAssertEqual(mockUserDefaults.gameStyleChanged, 0, "gameStyleChanged should be 0 before sendActions")
			segmentedControl.addTarget(controllerUnderTest, action: #selector(ViewController.chooseGameStyle(_:)), for: .valueChanged)
			segmentedControl.sendActions(for: .valueChanged) // programmatically "interact" with segmented control
			// Then...
			XCTAssertEqual(mockUserDefaults.gameStyleChanged, 1, "gameStyle user default wasn't changed")
		}
		
		func testPerformanceExample() {
			// This is an example of a performance test case.
			self.measure {
				// Put the code you want to measure the time of here.
			}
		}
		
}
