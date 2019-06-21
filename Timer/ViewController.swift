//
//  ViewController.swift
//  Timer
//
//  Created by Reginald McDonald on 2019-06-19.
//  Copyright © 2019 Reginald McDonald. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    var time: Time!;
    var isRunning: Bool! = false;
    var isResetable: Bool! = false;
    
    @IBOutlet weak var timeField: UILabel!
    @IBOutlet weak var timePicker: UIDatePicker!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    
    @IBAction func onTimeChange(_ sender: UIDatePicker) {
        time.setTime(sec: sender.countDownDuration);
        secondsToTime(sender.countDownDuration);
    }
    
    @objc func firstTimeChange() {
        print("was called");
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
        time = Time(sec: 60, onTick);
        timePicker.countDownDuration = 60;
        secondsToTime(60);
        updateButtons();
    }

    @IBAction func handleStartButton(_ sender: UIButton) {
        if !isRunning {
            time.startCountdown();
            isRunning = true;
            isResetable = false;
            updateButtons();
            print("Start pressed");
        }
        
    }
    
    @IBAction func handleResetButton(_ sender: UIButton) {
        if isRunning {
            time.stop();
            isRunning = false;
            isResetable = true;
        } else {
            time.reset();
            isRunning = false;
            isResetable = false;
            secondsToTime(timePicker.countDownDuration);
        }
        updateButtons();
    }
    
    func onTick(_ t: TimeInterval) {
        secondsToTime(t);
    }
    
    func secondsToTime(_ tX: TimeInterval) {
        var t = tX;
        var displayTime = "";
        // Compute the hours
        let hours = floor((t / 3600));
        let hoursString: String!;
        if hours < 10 {
            hoursString = "0" + Int(hours).description;
        } else {hoursString = Int(hours).description;}
        // Compute the minutes string
        t -= (hours * 3600);
        let minutes = floor((t / 60));
        let minutesString: String!;
        if minutes < 10 {
            minutesString = "0" + Int(minutes).description;
        } else {
            minutesString = Int(minutes).description;
        }
        // Compute the seconds
        t -= (minutes * 60);
        let seconds = t;
        let secondsString: String!;
        if seconds < 10 {
            secondsString = "0" + Int(seconds).description;
        } else {
            secondsString = Int(seconds).description;
        }
        
        displayTime = hoursString + ":" + minutesString + ":" + secondsString;
        
        timeField.text = displayTime;
    }
    
    func updateButtons() {
        if isRunning && isResetable {
            startButton.isEnabled = false;
            pauseButton.isEnabled = true;
            timePicker.isEnabled = false;
            pauseButton.setTitle("Pause", for: .normal);
        } else if isRunning && !isResetable {
            startButton.isEnabled = false;
            pauseButton.isEnabled = true;
            timePicker.isEnabled = false;
            pauseButton.setTitle("Pause", for: .normal);
        } else if !isRunning && !isResetable {
            startButton.isEnabled = true;
            pauseButton.isEnabled = false;
            timePicker.isEnabled = true;
            pauseButton.setTitle("Pause", for: .normal);
        } else {
            startButton.isEnabled = true;
            pauseButton.isEnabled = true;
            timePicker.isEnabled = false;
            pauseButton.setTitle("Reset", for: .normal);
        }
    }
}

