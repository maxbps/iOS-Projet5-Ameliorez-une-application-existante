//
//  CountOnMeTests.swift
//  CountOnMeTests
//
//  Created by Maxime Bontemps on 20/03/2019.
//  Copyright © 2019 Ambroise Collon. All rights reserved.
//

import XCTest
@testable import CountOnMe

class CountOnMeTests: XCTestCase {
    var calculation: Calculation!
    
    override func setUp(){
        super.setUp()
        calculation = Calculation()
    }

    
    func testex(){
        XCTAssert(true)
    }
    
    func testGivenClear_WhenStringNumbersIsEmpty_ThenStringNumberIsCleared() {
        calculation.clear()
        
        XCTAssert(calculation.stringNumbers == [String()])
        XCTAssert(calculation.operators == ["+"])
        XCTAssert(calculation.index == 0)
    }
    func testGivenClear_WhenStringNumbersIsNotEmpty_ThenStringNumberIsCleared() {
        calculation.addNewNumber(3)
        calculation.operators = ["+"]
        calculation.addNewNumber(2)
        calculation.addNewNumber(8)
        calculation.addNewNumber(2)
        calculation.calculateTotal()
        calculation.clear()
        
        XCTAssert(calculation.stringNumbers == [String()])
        XCTAssert(calculation.operators == ["+"])
        XCTAssert(calculation.index == 0)
    }
    
    func testGivenCalculateTotal_whenOperatorIsPlus_ThenTotalIsCorrect(){
        calculation.addNewNumber(3)
        calculation.addNewNumber(9)
        calculation.operators.append("+")
        calculation.stringNumbers.append("")
        calculation.addNewNumber(2)
        calculation.addNewNumber(8)
        calculation.addNewNumber(4)
       
        calculation.calculateTotal()
        print("\(calculation.total)")
        XCTAssert(calculation.total == 323 )
        
    }
    
    func testGivenCalculateTotal_whenOperatorIsMinus_ThenTotalIsCorrect(){
        calculation.addNewNumber(2)
        calculation.addNewNumber(8)
        calculation.operators.append("-")
        calculation.stringNumbers.append("")
        calculation.addNewNumber(1)
        calculation.addNewNumber(9)
        
        
        calculation.calculateTotal()
        print("\(calculation.total)")
        XCTAssert(calculation.total == 9 )
        
    }
    
    func testGivenIsExpressionCorrect_WhenStringNumberContainNothing_ThenExpressionReturnFalse() {
        XCTAssertFalse(calculation.isExpressionCorrect)
    }
    
    func testGivenIsExpressionCorrect_WhenExpressionTappedIsNotCorrect_ThenExpressionReturnFalse() {
        calculation.addNewNumber(1)
        calculation.operators.append("-")
        calculation.stringNumbers.append("")
        
        XCTAssertFalse(calculation.isExpressionCorrect)
    }
    
    func testGivenAddAnOperator_WhenAlreadyHaveAnOperatorOrNot_canIAddOperator() {
        calculation.addNewNumber(1)
        calculation.operators.append("-")
        calculation.stringNumbers.append("")
        
        
        XCTAssert(calculation.canAddOperator == false)
        calculation.addNewNumber(1)
        XCTAssert(calculation.canAddOperator == true)
    }
}
