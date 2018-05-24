//
//  FetchSMSCodeButton.swift
//  paopao
//
//  Created by michelle on 2018/4/12.
//  Copyright © 2018年 michelle. All rights reserved.
//

import Foundation
import UIKit

class FetchSMSCodeButton: UIButton {
    
    fileprivate weak var timer: Timer!
    fileprivate var duration = 60
    
    deinit {
        if timer != nil {
            timer.invalidate()
        }
    }
    
    func startCountdown() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(FetchSMSCodeButton.countdown), userInfo: nil, repeats: true)
        timer.fire()
        self.setTitleColor(UIColor.brown, for: .normal)
        self.isEnabled = false
    }
    
    @objc fileprivate func countdown() {
        guard duration > 0 else {
            duration = 60
            timer.invalidate()
            timer = nil
            self.setTitle("Get Code", for: .normal)
            self.setTitleColor(UIColor.brown, for: .normal)
            self.isEnabled = true
            return
        }
        
        self.setTitle("Send Again\(duration)s", for: .normal)
        
        duration = duration - 1
    }
    
}
