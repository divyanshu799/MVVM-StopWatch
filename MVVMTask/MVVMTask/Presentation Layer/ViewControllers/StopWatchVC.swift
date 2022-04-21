//
//  ViewController.swift
//  MVVMTask
//
//  Created by Apple User on 21/04/22.
//

import UIKit

class StopWatchVC: UIViewController,StopwatchViewModelDelegate {
    func updateTimerLabel(sec: String) {
        timeLbl.text = sec
    }
    

    //MARK: - Outlets
    private var vmObj: StopWatchViewModel!
    
    @IBOutlet weak var pauseBtn: UIButton!
    @IBOutlet weak var stopBtn: UIButton!
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var alertLbl: UILabel!
   
    
    //MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pauseBtn.isEnabled = false
        self.vmObj = StopWatchViewModel()
        vmObj.delegate = self
    }
    
    //MARK: - Actions
    
    @IBAction func startTimer(_ sender: Any) {
        if vmObj.isTimerRunning == false {
            vmObj.runTimer()
            pauseBtn.isEnabled = true
            self.startBtn.isEnabled = false
            alertLbl.text = "RUN!!"
            self.stopBtn.setTitle("Reset", for: .normal)
             }
    }
    
    @IBAction func pauseTimer(_ sender: Any) {
  
             if vmObj.resumeTapped == false {
                 vmObj.timer.invalidate()
                 vmObj.resumeTapped = true
                 alertLbl.text = "DON'T STOP NOW!!"
                 self.pauseBtn.setTitle("Resume", for: .normal)
             } else {
                 vmObj.runTimer()
                 vmObj.resumeTapped = false
                 alertLbl.text = "KEEP RUNNING!!"
                 self.pauseBtn.setTitle("Pause", for: .normal)
             }
        }
    
    @IBAction func stopTimer(_ sender: Any) {
        vmObj.timer.invalidate()
        vmObj.seconds = 0
        alertLbl.text = ""
        timeLbl.text = vmObj.seconds.timeString()
        self.stopBtn.setTitle("Stop", for: .normal)
        self.startBtn.isEnabled = true
        vmObj.isTimerRunning = false
        self.pauseBtn.isEnabled = false
        
    }

}
//MARK: - Protocol
protocol StopwatchViewModelDelegate: NSObjectProtocol{
    func updateTimerLabel(sec:String)
}


