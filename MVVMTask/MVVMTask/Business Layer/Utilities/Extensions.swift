//
//  Extensions.swift
//  MVVMTask
//
//  Created by Apple User on 21/04/22.
//

import Foundation

extension Int {
    func timeString() -> String {
        let hours = self / 3600
    let minutes = self / 60 % 60
    let seconds = self % 60
        return String(format: "%02i:%02i:%02i" , hours, minutes, seconds)
    }
}
