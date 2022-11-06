//
//  TimerView.swift
//  Clock
//
//  Created by Jinho Choi on 2022/10/31.
//

import SwiftUI

struct TimerView: View {
    @State private var temp: Set<DateComponents> = [DateComponents(hour:0, minute: 10, second: 0)]
    @State private var tem: Date = Date()
    @State private var showingSound: Bool = false

    var body: some View {
            VStack {
                
                HStack {
                    Button {
                        
                    } label: {
                        ZStack {
                            Circle()
                                .foregroundColor(.gray)
                                .frame(width:80)
                            Text("Cancel")
                        }
                    }
                    Spacer()
                    Button {
                        
                    } label: {
                        ZStack {
                            Text("Start")
                        }
                    }
                }
                .padding(.horizontal)
                List {
                    Button {
                        showingSound.toggle()
                    } label: {
                        HStack {
                            Text("When Timer Ends")
                            Spacer()
                            Text("Radar")
                                .foregroundColor(.secondary)
                            Image(systemName: "chevron.right")
                                .foregroundColor(.secondary)
                        }
                        .foregroundColor(.white)
                    }
                    .sheet(isPresented: $showingSound) {
                        WorldClockAddRegion()
                    }
                }
            }
        }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
