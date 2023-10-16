//
//  ContentView.swift
//  RobotTest
//
//  Created by Vikarn Barai on 14/10/23.
//

import SwiftUI

struct ContentView: View {
    @State var xPos: String = ""
    @State var yPos: String = ""
    @State var direction: Int = 0
    @State var commandText = ""
    @State var robot = Robot()

    @State var showingAlert: Bool = false
    var body: some View {
        VStack(spacing: 40) {
            header
            postion
            directionView
            commentView
            report
            Spacer()
        }
        .alert(robot.getCurrentPostion(), isPresented: $showingAlert) {
            Button("OK", role: .cancel) { 
                self.reset()
                
            }
        }
//        .padding()
    }
    private var header: some View {
        ZStack {
            Text("Toy Robot")
            
            HStack{
                Spacer()
                Button("Reset") {
                    self.reset()
                }.padding(.trailing)
            }
        }
    }
    private var postion: some View {
        HStack {
            TextField(
              "Enter X position",
              text: $xPos.max(1),
              onEditingChanged: { changed in
                //code here
              }
            ) 
            .keyboardType(.numberPad)

            .padding(7)
            .overlay(
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(Color.black, lineWidth: 1)
                )
            .multilineTextAlignment(.center)
            TextField(
              "Enter Y position",
              text: $yPos.max(1),
              onEditingChanged: { changed in
                //code here
              }
            )
            .keyboardType(.numberPad)

            .padding(7)
            .overlay(
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(Color.black, lineWidth: 1)
                )
            .multilineTextAlignment(.center)
        }
    }
    
    private var directionView: some View {
        Picker("Enter Direction", selection: $direction) {
            Text("Nort").tag(0)
            Text("East").tag(1)
            Text("South").tag(2)
            Text("West").tag(3)
        }
        .pickerStyle(.segmented)
    }
    
    private var commentView: some View {
        HStack {
            Spacer()
            Button("Left") {
                commandText += Command.left.name
            }
            Spacer()
            Button("Right") {
                commandText += Command.right.name
            }
            Spacer()
            Button("Move") {
                commandText += Command.move.name
            }
            Spacer()
        }
    }
    
    private var report: some View {
        HStack {
            Spacer()
            Button("Report") {
                if let rawValueDirection = Direction(rawValue: direction), !commandText.isEmpty {

                    robot.setPosition(xPoint: Int(xPos) ?? 0,
                                      yPoint: Int(yPos) ?? 0,
                                      direction: rawValueDirection)
                    robot.processRobotCommand(command: commandText)
                    showingAlert.toggle()
                }

            }
            Spacer()
        }
    }
    
    private func reset() {
        withAnimation {
            xPos = ""
            yPos = ""
            direction = 0
            self.commandText = ""
        }
    }
}


#Preview {
    ContentView()
}
