//
//  Robot.swift
//  RobotTest
//
//  Created by Vikarn Barai on 14/10/23.
//

import Foundation

enum Direction: Int {
    case north, east, south, west
    var name: String {
        switch self {
        case .north:
        return "North"
        case .east:
        return "East"
        case .south:
        return "South"
        case .west:
        return "West"
        }
    }
    
}

enum Command: Int {
    case left, right, move
    
    var name: String {
        switch self {
        case .left:
        return "L"
        case .right:
        return "R"
        case .move:
        return "M"
    
        }
    }
}
enum RobotError: Error {
    case invalidCommand
    case invalidRange
}

struct Position {
    let xValue: Int
    let yValue: Int
    
    let direction: Direction
    
    init(xValue: Int, yValue: Int, direction: Direction) {
        self.xValue = xValue
        self.yValue = yValue
        self.direction = direction
    }
}

class Robot {
    private let maxTableSize = 5
    private var xPoint: Int = 0
    private var yPoint: Int = 0
    private var direction: Direction = {
        return .north
    }()
    
    public func setPosition(xPoint:Int, yPoint:Int, direction:Direction){
        self.xPoint = xPoint
        self.yPoint = yPoint
        self.direction = direction
    }
    private func currentPosition() -> Position {
        return Position(xValue: xPoint, yValue: yPoint, direction: direction)
    }
    
    // turn left.
    private func turnLeft(){
        if (direction.rawValue - 1) < Direction.north.rawValue {
            direction = .west
        } else {
            guard let rawValueFacing = Direction(rawValue: direction.rawValue - 1) else { return }
            direction = rawValueFacing
        }
    }
    
    // turn Right.
    private func turnRight(){
        if (direction.rawValue + 1) > Direction.west.rawValue {
            direction = .north
        } else {
            guard let rawValueFacing = Direction(rawValue: direction.rawValue + 1) else { return }
            direction = rawValueFacing
        }
    }
    
    // move Robot.
    private func move() {
        if (direction == .north && yPoint != maxTableSize && yPoint >= 0) {
            yPoint = yPoint + 1
        } else if (direction == .east && xPoint != maxTableSize && xPoint >= 0) {
            xPoint = xPoint + 1
        } else if (direction == .south && yPoint != 0 && yPoint >= 0) {
            yPoint = yPoint - 1
        } else if (direction == .west && xPoint != 0 && xPoint >= 0) {
            xPoint = xPoint - 1
        } else {
        }
    }
    
    public func processRobotCommand(command:String) {
        _ = command.map { processCommand(char: $0) }
    }
    

    private func processCommand(char: Character) {
        switch char {
        case "L": 
        turnLeft()
        case "R": 
        turnRight()
        case "M": 
        move()
        default:  print(RobotError.invalidCommand)
            
        }
    }
    
    public func getCurrentPostion() -> String{
        let postion = self.currentPosition()
        return String(postion.xValue.description + " " + postion.yValue.description + " " + postion.direction.name)
    }
}
