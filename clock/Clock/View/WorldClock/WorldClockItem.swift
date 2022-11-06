//
//  WorldClockItem.swift
//  Clock
//
//  Created by Jinho Choi on 2022/10/31.
//

import SwiftUI

struct WorldClockItem: View {
    var region: TimeZone
    @Environment(\.editMode) var editMode
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(getTimeDiff(timezone:region))
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .padding(.bottom, 0)
                Text(region.identifier.split(separator: "/")[1])
                    .font(.title2)
            }
            .frame(height: 40)
            Spacer()
            HStack(alignment: .bottom) {
                if editMode?.wrappedValue == .inactive {
                    Text(getTime(date: Date(), timezone: region, mode: 0))
                        .font(.system(size: 50))
                        .fontWeight(.light)
                        .padding(.trailing, -5)
                    Text(getTime(date: Date(), timezone: region, mode: 1))
                        .font(.title)
                        .padding(.bottom, 5)
                }
            }
            .transition(.move(edge: .top))
        }
        .frame(height: 70.0)
    }
}

struct WorldClockItem_Previews: PreviewProvider {
    static var previews: some View {
        WorldClockItem(region: ModelData().regions[0])
            .environmentObject(ModelData())
    }
}
