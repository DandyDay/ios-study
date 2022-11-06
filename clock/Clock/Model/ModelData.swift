//
//  ModelData.swift
//  Clock
//
//  Created by Jinho Choi on 2022/10/31.
//

import Foundation

final class ModelData: ObservableObject {
    @Published var regions: [TimeZone] = [TimeZone.current, TimeZone(abbreviation: "ADT")!, TimeZone(identifier: "Pacific/Apia")!]
    @Published var alarms: [Alarm] = [Alarm.default, Alarm(label: "Hihi", isActivated: false)]
}
