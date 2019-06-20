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
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let f = onTick;
        time = Time(sec: 10, f);
        // Do any additional setup after loading the view.
    }

    @IBAction func handleStartButton(_ sender: UIButton) {
        time.startCountdown();
        print("Start pressed");
    }
    
    @IBAction func handleResetButton(_ sender: UIButton) {
        print ("Reset pressed");
    }
    
    func onTick(_ t: TimeInterval) {
        print(t);
    }
}

