//
//  ContentModel.swift
//  CountMyMoneys_1.0
//
//  Created by Monika Herain on 3.10.2023.
//

import Foundation

class ContentModel: ObservableObject {
    
    @Published var hoursTotal = 0.0
    @Published var currentTimer = TimeInterval()
    var timer = Timer()
    

    func startTimer() {
        if currentTimer == 0 {
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                self.currentTimer += 1
                self.hoursTotal += 1
            }
        }
    }
    
    func stopTimer() {
        if currentTimer != 0 {
            timer.invalidate()
            currentTimer = 0
        }
    }
}
