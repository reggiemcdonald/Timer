//
//  Time.swift
//  Timer
//
//  Created by Reginald McDonald on 2019-06-19.
//  Copyright © 2019 Reginald McDonald. All rights reserved.
//

import Foundation

class Time {
    typealias Second = TimeInterval;
    private var seconds: Second;
    private var timer: Timer = Timer();
    private let oneSecond: Second = 1;
    private let onTick: (Second) -> ();
    
    init (sec s: Second, _ userOnTick: @escaping (Second) -> ()) {
        seconds = s;
        onTick = userOnTick;
    }
    
    func setTime(sec s: Second) {
        seconds = s;
    }
    
    private func incrementOneSec() -> (Second) {
        seconds += oneSecond;
        return seconds;
    }
    
    private func decrementOneSec() -> (Second) {
        seconds -= oneSecond;
        return seconds;
    }
    
    func startCountdown() {
        if seconds < 1 {
            return;
        }
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(handleTick)), userInfo: nil, repeats: true);
    }
    
    @objc func handleTick() {
        let t = decrementOneSec();
        if t <= 0 {
            timer.invalidate();
        }
        onTick(t);
    }
}
