//
//  WorldClockFuncs.swift
//  Clock
//
//  Created by Jinho Choi on 2022/10/31.
//

import Foundation

func getTime(date: Date, timezone: TimeZone, mode: Int) -> String {
    let format = DateFormatter()
    if mode == 0 {
        format.dateFormat = "h:mm"
    }
    if mode == 1 {
        format.dateFormat = "a"
    }
    format.timeZone = timezone
    return format.string(from: date)
}

func getAlarmTime(date: Date, mode: Int) -> String {
    let format = DateFormatter()
    if mode == 0 {
        format.dateFormat = "h:mm"
    }
    if mode == 1 {
        format.dateFormat = "a"
    }
    return format.string(from: date)
}

func getTimeDiff(timezone: TimeZone) -> String {
    let timeDiff: Int = timezone.secondsFromGMT() - TimeZone.current.secondsFromGMT()
    let timeDiffString: String = secondsToHoursMinutesString(timeDiff)
    
    if Calendar.current.isDateInTomorrow(Date(timeInterval: TimeInterval(timeDiff), since: Date())) {
        return "Tomorrow, \(timeDiffString)"
    } else if Calendar.current.isDateInYesterday(Date(timeInterval: TimeInterval(timeDiff), since: Date())) {
        return "Yesterday, \(timeDiffString)"
    } else {
        return "Today, \(timeDiffString)"
    }
}

func secondsToHoursMinutesString(_ seconds: Int) -> String {
    let hour: Int = seconds / 3600
    let minute: Int = abs((seconds % 3600) / 60)
    if minute == 0 {
        return hour >= 0 ? "+\(hour)HRS" : "\(hour)HRS"
    } else {
        return "\(hour):\(minute)"
    }
}
