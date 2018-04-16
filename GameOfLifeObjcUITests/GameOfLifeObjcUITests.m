//
//  GameOfLifeObjcUITests.m
//  GameOfLifeObjcUITests
//
//  Created by Stefan Lage on 16/04/2018.
//  Copyright © 2018 Edu Caselles. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface GameOfLifeObjcUITests : XCTestCase

@end

@implementation GameOfLifeObjcUITests

- (void)setUp {
    [super setUp];

    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.buttons[@"Start"] tap];
    [app.alerts[@"Hello World!"].buttons[@"OK"] tap];

}

@end
