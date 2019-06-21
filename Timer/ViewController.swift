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
    @IBOutlet weak var timeField: UILabel!
    
    
    @IBAction func onTimeChange(_ sender: UIDatePicker) {
        time.setTime(sec: sender.countDownDuration);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
        time = Time(onTick);
        
        // Do any additional setup after loading the view.
    }

    @IBAction func handleStartButton(_ sender: UIButton) {
        time.startCountdown();
        print("Start pressed");
    }
    
    @IBAction func handleResetButton(_ sender: UIButton) {
        time.reset();
        print ("Reset pressed");
    }
    
    func onTick(_ t: TimeInterval) {
        secondsToTime(t);
    }
    
    func secondsToTime(_ tX: TimeInterval) -> () {
        var t = tX;
        var displayTime = "";
        let hours = floor((t / 3600));
        t -= (hours * 3600);
        let minutes = floor((t / 60));
        t -= (minutes * 60);
        let seconds = t;
        displayTime = Int(hours).description + ":" + Int(minutes).description + ":" + Int(seconds).description;
        timeField.text = displayTime;
    }
}

