//
//  AlarmRepeatView.swift
//  Clock
//
//  Created by Jinho Choi on 2022/11/04.
//

import SwiftUI

struct AlarmRepeatView: View {
    @Binding var alarm: Alarm

    var body: some View {
        List {
            Button {
                alarm.repeated.sunday.toggle()
            } label: {
                AlarmRepeatItem(text: "Every Sunday", check: $alarm.repeated.sunday)
            }
            Button {
                alarm.repeated.monday.toggle()
            } label: {
                AlarmRepeatItem(text: "Every Monday", check: $alarm.repeated.monday)
            }
            Button {
                alarm.repeated.tuesday.toggle()
            } label: {
                AlarmRepeatItem(text: "Every Tuesday", check: $alarm.repeated.tuesday)            }
            Button {
                alarm.repeated.wednesday.toggle()
            } label: {
                AlarmRepeatItem(text: "Every Wednesday", check: $alarm.repeated.wednesday)
            }
            Button {
                alarm.repeated.thursday.toggle()
            } label: {
                AlarmRepeatItem(text: "Every Thursday", check: $alarm.repeated.thursday)
            }
            Button {
                alarm.repeated.friday.toggle()
            } label: {
                AlarmRepeatItem(text: "Every Friday", check: $alarm.repeated.friday)
            }
            Button {
                alarm.repeated.saturday.toggle()
            } label: {
                AlarmRepeatItem(text: "Every Saturday", check: $alarm.repeated.saturday)
            }
        }
    }
}

struct AlarmRepeatView_Previews: PreviewProvider {
    static var previews: some View {
        AlarmRepeatView(alarm: .constant(Alarm.default))
            .preferredColorScheme(.dark)
    }
}
