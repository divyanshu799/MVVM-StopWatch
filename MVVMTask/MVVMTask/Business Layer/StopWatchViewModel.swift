//
//  StopWatchViewModel.swift
//  MVVMTask
//
//  Created by Apple User on 21/04/22.
//

import Foundation
class StopWatchViewModel: NSObject {
    weak var delegate: StopwatchViewModelDelegate?
  
    var seconds = 0
    var timer = Timer()
    var isTimerRunning = false
    var resumeTapped = false
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
        isTimerRunning = true
    }
    @objc func updateTimer() {
        seconds += 1
        delegate?.updateTimerLabel(sec: seconds.timeString())
             }

}
