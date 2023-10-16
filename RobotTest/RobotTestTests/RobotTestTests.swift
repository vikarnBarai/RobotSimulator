//
//  RobotTestTests.swift
//  RobotTestTests
//
//  Created by Vikarn Barai on 15/10/23.
//

import XCTest
@testable import RobotTest

final class RobotTestTests: XCTestCase {
    var robot: Robot!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.robot = Robot()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        self.robot = nil
    }

    func testRobotFacingWest() {
        let expectedOutput = "0 4 West"
        let robot = Robot()
        robot.setPosition(xPoint: 1,
                          yPoint: 2,
                          direction: .north)
        
        robot.processRobotCommand(command: "LMLLMLMMLMM")

        debugPrint("getCurrentPostion \(robot.getCurrentPostion())")
        XCTAssertEqual(expectedOutput, robot.getCurrentPostion())
    }
    
    func testRobotFacingSouth() {
        let expectedOutput = "3 1 East"
        robot.setPosition(xPoint: 2,
                          yPoint: 1,
                          direction: .east)
        
        robot.processRobotCommand(command: "MMLMLMLML")
        XCTAssertEqual(expectedOutput, robot.getCurrentPostion())
    }
    
    func testRobotFacingNorth() {
        let expectedOutput = "2 4 North"
        robot.setPosition(xPoint: 1,
                          yPoint: 4,
                          direction: .south)
        
        robot.processRobotCommand(command: "MMLMLMM")
        XCTAssertEqual(expectedOutput, robot.getCurrentPostion())
    }
    
    func testRobotAvoidFallingFromTable() {
        let expectedOutput = "5 5 West"
        robot.setPosition(xPoint: 5,
                          yPoint: 4,
                          direction: .east)
        robot.processRobotCommand(command: "RMRMRMRMLML")
        XCTAssertEqual(expectedOutput, robot.getCurrentPostion())
    }
}
