//
//  GameOfLifeUITests.swift
//  GameOfLifeUITests
//
//  Created by Edu Caselles on 10/8/16.
//  Copyright © 2016 Edu Caselles. All rights reserved.
//

import XCTest

class GameOfLifeUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.

        let app = XCUIApplication()
        XCTAssertTrue(app.tables.cells.staticTexts["Toad"].exists)
        XCTAssertTrue(app.tables.cells.staticTexts["Blinker"].exists)
        XCTAssertTrue(app.tables.cells.staticTexts["Pulsar"].exists)
        XCTAssertTrue(app.tables.cells.staticTexts["Beacon"].exists)

        let gameOfLifeNavigationBar = app.navigationBars["Game of Life"]

        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Toad"]/*[[".cells.staticTexts[\"Toad\"]",".staticTexts[\"Toad\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()

        let collectionViewsQuery = app.collectionViews
        collectionViewsQuery.children(matching: .cell).element(boundBy: 7).children(matching: .other).element.tap()
        collectionViewsQuery.children(matching: .cell).element(boundBy: 8).children(matching: .other).element.tap()
        app.navigationBars["Toad"].buttons["Game of Life"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Beacon"]/*[[".cells.staticTexts[\"Beacon\"]",".staticTexts[\"Beacon\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["Beacon"].buttons["Game of Life"].tap()

        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Blinker"]/*[[".cells.staticTexts[\"Blinker\"]",".staticTexts[\"Blinker\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["Blinker"].buttons["Game of Life"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Pulsar"]/*[[".cells.staticTexts[\"Pulsar\"]",".staticTexts[\"Pulsar\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        collectionViewsQuery.children(matching: .cell).element(boundBy: 240).children(matching: .other).element.tap()
        app.navigationBars["Pulsar"].buttons["Game of Life"].tap()

        gameOfLifeNavigationBar.buttons["Edit"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["Delete Toad"]/*[[".cells.buttons[\"Delete Toad\"]",".buttons[\"Delete Toad\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery.buttons["Delete"].tap()
        gameOfLifeNavigationBar.buttons["Add"].tap()
    }
}
