//
//  AlarmItem.swift
//  Clock
//
//  Created by Jinho Choi on 2022/11/01.
//

import SwiftUI

struct AlarmItem: View {
    @Binding var alarm: Alarm
    @Environment(\.editMode) var editMode

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
                Text(alarm.label == "" ? "Alarm" : alarm.label)
            }
            Spacer()
            if editMode?.wrappedValue == .inactive {
                Toggle("", isOn: $alarm.isActivated)
                    .preferredColorScheme(.dark)
            }
        }
    }
}

struct AlarmItem_Previews: PreviewProvider {
    static var previews: some View {
        AlarmItem(alarm: .constant(ModelData().alarms[0]))
            .preferredColorScheme(.dark)
    }
}
