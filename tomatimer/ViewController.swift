//
//  ViewController.swift
//  tomatimer
//
//  Created by guillaume on 18/9/18.
//  Copyright © 2018 black rope studio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var minutesLabel: UILabel!
    @IBOutlet weak var secondsLabel: UILabel!
    @IBOutlet weak var millisecondsLabel: UILabel!
    @IBOutlet weak var resetBtn: UIButton!
    @IBOutlet weak var startBtn: UIButton!

    weak var timer: Timer?
    var startTime: Double = 0
    var time: Double = 0
    var elapsed: Double = 0
    var isTimerRunning: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetBtn.isEnabled = false
    }
    
    
    @IBAction func startStop() {
        if !isTimerRunning {
            startBtn.isEnabled = false
            resetBtn.isEnabled = true
            startTimer()
        } else {
            startBtn.isEnabled = true
            resetBtn.isEnabled = false
            stopTimer()
            resetLabels()
        }
        isTimerRunning = !isTimerRunning
    }
    
    func startTimer() {
        startTime = Date().timeIntervalSinceReferenceDate - elapsed
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    func stopTimer() {
        elapsed = Date().timeIntervalSinceReferenceDate - startTime
        timer?.invalidate()
    }
    
    func resetLabels() {
        minutesLabel.text = "00"
        secondsLabel.text = "00"
        millisecondsLabel.text = "00"
    }
    
    @objc func updateCounter() {
        time = Date().timeIntervalSinceReferenceDate - startTime
        let minutes = UInt8(time/60.0)
        time -= (TimeInterval(minutes) * 60)
        
        let seconds = UInt8(time)
        time -= TimeInterval(seconds)

        let milliseconds = UInt8(time*100)
        
        let strMinutes = String(format: "%02d", minutes)
        let strSeconds = String(format: "%02d", seconds)
        let strMilliseconds = String(format: "%02d", milliseconds)
        
        minutesLabel.text = strMinutes
        secondsLabel.text = strSeconds
        millisecondsLabel.text = strMilliseconds
    }
}

