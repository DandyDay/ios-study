//
//  AlarmFuncs.swift
//  Clock
//
//  Created by Jinho Choi on 2022/11/04.
//

import Foundation

func getAlarmRepeatedString (repeated: AlarmRepeat) -> String {
    if !repeated.sunday && !repeated.monday && !repeated.tuesday && !repeated.wednesday && !repeated.thursday && !repeated.friday && !repeated.saturday {
        return "Never"
    }
    if repeated.sunday && repeated.monday && repeated.tuesday && repeated.wednesday && repeated.thursday && repeated.friday && repeated.saturday {
        return "Every day"
    }
    if !repeated.sunday && repeated.monday && repeated.tuesday && repeated.wednesday && repeated.thursday && repeated.friday && !repeated.saturday {
        return "Weekdays"
    }
    if repeated.sunday && !repeated.monday && !repeated.tuesday && !repeated.wednesday && !repeated.thursday && !repeated.friday && repeated.saturday {
        return "Weekends"
    }
    var ret: String = ""
    if repeated.monday {
        if ret != "" {
            ret += " "
        }
        ret += "Mon"
    }
    if repeated.tuesday {
        if ret != "" {
            ret += " "
        }
        ret += "Tue"
    }
    if repeated.wednesday {
        if ret != "" {
            ret += " "
        }
        ret += "Wed"
    }
    if repeated.thursday {
        if ret != "" {
            ret += " "
        }
        ret += "Thu"
    }
    if repeated.friday {
        if ret != "" {
            ret += " "
        }
        ret += "Fri"
    }
    if repeated.saturday {
        if ret != "" {
            ret += " "
        }
        ret += "Sat"
    }
    if repeated.sunday {
        if ret != "" {
            ret += " "
        }
        ret += "Sun"
    }
    if ret.count == 3 {
        ret = "Every " + ret + "day"
    }
    return ret
}
