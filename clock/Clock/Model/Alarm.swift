//
//  Alarm.swift
//  Clock
//
//  Created by Jinho Choi on 2022/10/31.
//

import Foundation

struct AlarmRepeat {
    var sunday: Bool = false
    var monday: Bool = false
    var tuesday: Bool = false
    var wednesday: Bool = false
    var thursday: Bool = false
    var friday: Bool = false
    var saturday: Bool = false
}

struct Alarm: Identifiable {
    var time: Date = Date(timeIntervalSinceNow: 86400)
    
    var label: String
    var repeated: AlarmRepeat = AlarmRepeat()
    var sound: String = "Radar"
    var snooze: Bool = true
    var isActivated: Bool = true
    var id: Date { time }

    static let `default` = Alarm(label: "")
}

