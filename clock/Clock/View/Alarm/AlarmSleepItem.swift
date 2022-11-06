//
//  AlarmSleepItem.swift
//  Clock
//
//  Created by Jinho Choi on 2022/11/01.
//

import SwiftUI

struct AlarmSleepItem: View {
    var alarm: Alarm
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack(alignment: .bottom) {
                    Text(getAlarmTime(date: alarm.time, mode: 0))
                        .font(.system(size: 50))
                        .fontWeight(.light)
                        .padding(.trailing, -5)
                    Text(getAlarmTime(date: alarm.time, mode: 1))
                        .font(.title)
                        .padding(.bottom, 5)
                }
                .padding(.bottom, -10)
                Text("This Morning")
            }
            Spacer()
            Button {
                
            } label: {
                Text("CHANGE")
                    .font(.subheadline)
                    .foregroundColor(.orange)
            }
            .buttonStyle(.bordered)
            .buttonBorderShape(.roundedRectangle(radius: 30))
        }
    }
}

struct AlarmSleepItem_Previews: PreviewProvider {
    static var previews: some View {
        AlarmSleepItem(alarm: ModelData().alarms[0])
    }
}
