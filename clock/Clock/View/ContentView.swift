//
//  ContentView.swift
//  Clock
//
//  Created by Jinho Choi on 2022/10/31.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .Timer
    @EnvironmentObject var modelData: ModelData
    
    enum Tab {
        case WorldClock
        case Alarm
        case Stopwatch
        case Timer
    }
    
    var body: some View {
        TabView(selection: $selection) {
            WorldClockView()
                .tabItem {
                    Label("World Clock", systemImage: "globe")
                }
                .tag(Tab.WorldClock)
            AlarmView()
                .tabItem {
                    Label("Alarm", systemImage: "alarm")
                }
                .tag(Tab.Alarm)
            StopwatchView()
                .tabItem {
                    Label("Stopwatch", systemImage: "stopwatch")
                }
                .tag(Tab.Stopwatch)
            TimerView()
                .tabItem {
                    Label("Timer", systemImage: "timer")
                }
                .tag(Tab.Timer)
        }
        .colorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
