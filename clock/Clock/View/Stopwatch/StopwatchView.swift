//
//  StopwatchView.swift
//  Clock
//
//  Created by Jinho Choi on 2022/10/31.
//

import SwiftUI

struct StopwatchView: View {
    @ObservedObject var time = CurrentTime()
    var body: some View {
        GeometryReader { geometry in
            VStack {
                TabView {
                    Text("00:02.91")
                        .font(.system(size:90))
                        .fontWeight(.thin)
                    StopwatchClock(time: time)
                        .padding(.all)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .frame(height: geometry.size.width * 16 / 15)
                .border(.black)
                
                HStack {
                    Button {
                        
                    } label: {
                        ZStack {
                            Circle()
                                .foregroundColor(.gray)
                                .frame(width:80)
                            Text("Cancel")
                                .foregroundColor(.white)
                        }
                    }
                    Spacer()
                    Button {
                        
                    } label: {
                        ZStack {
                            Circle()
                                .foregroundColor(.orange)
                                .frame(width:80)
                            Text("Start")
                        }
                    }
                }
                .padding(.horizontal)
                .offset(y: -geometry.size.height / 10)
                List {
                    Text("1")
                    Text("1")
                    Text("1")
                    Text("1")
                    Text("1")
                }
                .listStyle(.inset)
                .offset(y: -geometry.size.height / 10)
            }
        }
    }
}

struct StopwatchView_Previews: PreviewProvider {
    static var previews: some View {
        StopwatchView()
            .preferredColorScheme(.dark)
    }
}
