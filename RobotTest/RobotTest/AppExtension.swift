//
//  AppExtenstion.swift
//  RobotTest
//
//  Created by Vikarn Barai on 15/10/23.
//

import Foundation
import SwiftUI

extension Binding where Value == String {
    func max(_ limit: Int) -> Self {
        if let value =  Int(self.wrappedValue), value > 4 {
            DispatchQueue.main.async {
                self.wrappedValue = ""
            }
        }
        return self
    }
}
