//
//  BullsEyeTests.swift
//  BullsEyeTests
//
//  Created by Jeremy Broutin on 3/23/17.
//  Copyright © 2017 Ray Wenderlich. All rights reserved.
//

import XCTest
@testable import BullsEye

class BullsEyeTests: XCTestCase {
	
	var gameUnderTest: BullsEyeGame!
	
	override func setUp() {
		super.setUp()
		
		// Create an SUT (System Under Test) object at the class level
		// so that all the tests in this test class can access its properties and methods
		gameUnderTest = BullsEyeGame()
		gameUnderTest.startNewGame()
	}
	
	override func tearDown() {
		// Release SUT to ensure every test starts with a clean slate
		gameUnderTest = nil
		super.tearDown()
	}
	
	func testScoreIsComputedWhenGuessLTTarget() {
		// Given... setup any value needed
		let guess = gameUnderTest.targetValue - 5
		// When... execute the code being tested
		_ = gameUnderTest.check(guess: guess)
		// Then... assert the result expected with a message that prints if the test fails
		XCTAssertEqual(gameUnderTest.scoreRound, 95, "Score computed from guess is wrong")
		
		// ALternative naming systems to Given-When-Then are Arrange-Act-Assert or Assemble-Activate-Assert
	}
	
}
