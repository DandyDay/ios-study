//
//  StopwatchClock.swift
//  Clock
//
//  Created by Jinho Choi on 2022/11/04.
//

import SwiftUI
import Combine




struct StopwatchClock: View {
    @ObservedObject var time: CurrentTime

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Circle()
                    .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 1.0, opacity: 0.0))
                    .overlay(Circle().stroke())
                
                Clock(model: .init(type: .minute, timeInterval: time.seconds, tickScale: 0.6))
                    .stroke(Color.orange, style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round))
                    .rotationEffect(Angle.degrees(360/60))
                    .offset(y: -geometry.size.width / 4)
                
                Clock(model: .init(type: .second, timeInterval: time.seconds, tickScale: 1))
                    .stroke(Color.orange, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                    .rotationEffect(Angle.degrees(360/60))
            }.frame(width: geometry.size.width, height: geometry.size.width, alignment: .center)
        }
        .frame(alignment: .center)
    }
}

struct StopwatchClock_Previews: PreviewProvider {
    static var previews: some View {
        StopwatchClock(time: CurrentTime())
    }
}
