//
//  InterfaceController.swift
//  TimerWatchOsApp WatchKit Extension
//
//  Created by Mahmoud Elshakoushy on 06/10/2021.
//

import WatchKit
import Foundation


class MainIC: WKInterfaceController {

    // MARK: - Outlets
    @IBOutlet weak var timer: WKInterfaceTimer!
    @IBOutlet weak var startBtn: WKInterfaceButton!
    @IBOutlet weak var totalCountTimer: WKInterfaceTimer!
    
    //MARK: - Variables
    var isTimerStarted = false
    var startTime = Date()
    var elapsedTime: TimeInterval = 0.0
    var totalStarted = false
    
    // MARK: - View Life Cycle
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
    }
    
    override func willActivate() {
        super.willActivate()
        timer.setDate(Date())
    }
    
    override func didDeactivate() {
        super.didDeactivate()
    }
    
    // MARK: - Reset Function
    func setTimer(timer: WKInterfaceTimer, interval: TimeInterval) {
        if totalStarted && timer == totalCountTimer {
            return
        }
        timer.setDate(Date(timeIntervalSinceNow: interval))
        timer.start()
    }
    
    // MARK: - Buttons Actions
    @IBAction func startBtnPressed() {
        isTimerStarted = !isTimerStarted
        if isTimerStarted {
            startTime = Date()
            startBtn.setTitle("STOP")
            setTimer(timer: timer, interval: elapsedTime)
            setTimer(timer: totalCountTimer, interval: elapsedTime)
            totalStarted = true
        } else {
            let stoppedTime = Date()
            elapsedTime -= stoppedTime.timeIntervalSince(startTime)
            startBtn.setTitle("START")
            timer.stop()
        }
    }
    
    @IBAction func resetBtnPressed() {
        isTimerStarted = false
        startTime = Date()
        elapsedTime = 0.0
        totalStarted = false
        startBtn.setTitle("START")
        timer.setDate(startTime)
        timer.stop()
        totalCountTimer.setDate(startTime)
        totalCountTimer.stop()
    }
    
}
