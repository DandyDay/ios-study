//
//  WorldClockAddRegion.swift
//  Clock
//
//  Created by Jinho Choi on 2022/10/31.
//

import SwiftUI

struct WorldClockAddRegion: View {
    @EnvironmentObject var modelData: ModelData
    @State private var searchText = ""
    @Environment(\.presentationMode) var presentationMode
    
    var searchResults: [String] {
        if searchText.isEmpty {
            return TimeZone.knownTimeZoneIdentifiers
        } else {
            return TimeZone.knownTimeZoneIdentifiers.filter {$0.contains(searchText)}
        }
    }
    
    var body: some View {
        VStack {
            Text("Choose a City")
                .padding(.top, 5)
                .font(.caption)
            
            HStack {
                ZStack {
                    Rectangle()
                        .foregroundColor(Color(hue: 1.0, saturation: 0.03, brightness: 0.312))
                        .frame(height: 35)
                        .cornerRadius(10)
                    HStack {
                        Image(systemName: "magnifyingglass")
                        TextField("Search", text: $searchText)
                    }
                    .padding(.leading)
                }
                .padding(.leading)
                Spacer()
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Cancel")
                }
                .padding(.trailing)
            }
            
            List {
                ForEach(searchResults.sorted(by: regionCompare), id: \.hashValue) { timezone in
                    Button {
                        modelData.regions.append(TimeZone(identifier: timezone)!)
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text(timezone.components(separatedBy: "/").last!)
                    }
                }
            }
            .searchable(text: $searchText)
            .listStyle(.inset)
        }
        .preferredColorScheme(.dark)
    }
    
    func regionCompare(str1: String, str2: String) -> Bool {
        if (str1.components(separatedBy: "/").last! < str2.components(separatedBy: "/").last!) {
            return true
        } else {
            return false
        }
    }
}

struct WorldClockAddRegion_Previews: PreviewProvider {
    static var previews: some View {
        WorldClockAddRegion()
            .environmentObject(ModelData())
    }
}
