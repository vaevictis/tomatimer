//
//  TimerInterfaceController.swift
//  watch Extension
//
//  Created by guillaume on 19/9/18.
//  Copyright © 2018 black rope studio. All rights reserved.
//

import WatchKit
import Foundation


class TimerInterfaceController: WKInterfaceController {
    @IBOutlet var wMinutesLabel: WKInterfaceLabel!
    @IBOutlet var wSecondsLabel: WKInterfaceLabel!
    @IBOutlet var wMillisecondsLabel: WKInterfaceLabel!
    @IBOutlet var wStartBtn: WKInterfaceButton!
    @IBOutlet var wResetBtn: WKInterfaceButton!

    weak var timer: Timer?
    var startTime: Double = 0
    var time: Double = 0
    var elapsed: Double = 0
    var isTimerRunning: Bool = false
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        wResetBtn.setEnabled(false)

    }

    override func willActivate() {
        super.willActivate()
    }

    override func didDeactivate() {
        super.didDeactivate()
    }
    
    @IBAction func wStartStop() {
        if !isTimerRunning {
            wStartBtn.setEnabled(false)
            wResetBtn.setEnabled(true)
            wStartTimer()
        } else {
            wStartBtn.setEnabled(true)
            wResetBtn.setEnabled(false)
            wStopTimer()
            wResetLabels()
        }
        isTimerRunning = !isTimerRunning
    }
    
    func wStartTimer() {
        startTime = Date().timeIntervalSinceReferenceDate - elapsed
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(wUpdateCounter), userInfo: nil, repeats: true)
    }
    
    func wStopTimer() {
        elapsed = Date().timeIntervalSinceReferenceDate - startTime
        timer?.invalidate()
    }
    
    func wResetLabels() {
        wMinutesLabel.setText("00")
        wSecondsLabel.setText("00")
        wMillisecondsLabel.setText("00")
    }
    
    @objc func wUpdateCounter() {
        time = Date().timeIntervalSinceReferenceDate - startTime
        let minutes = UInt8(time/60.0)
        time -= (TimeInterval(minutes) * 60)
        
        let seconds = UInt8(time)
        time -= TimeInterval(seconds)
        
        let milliseconds = UInt8(time*100)
        
        let strMinutes = String(format: "%02d", minutes)
        let strSeconds = String(format: "%02d", seconds)
        let strMilliseconds = String(format: "%02d", milliseconds)
        
        wMinutesLabel.setText(strMinutes)
        wSecondsLabel.setText(strSeconds)
        wMillisecondsLabel.setText(strMilliseconds)
    }
}
