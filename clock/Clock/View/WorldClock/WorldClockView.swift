//
//  WorldClockView.swift
//  Clock
//
//  Created by Jinho Choi on 2022/10/31.
//

import SwiftUI

struct WorldClockView: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showingAddRegion = false
    @Environment(\.editMode) var editMode
    
    var body: some View {
        NavigationView {
            List {
                ForEach(modelData.regions, id:\.identifier) { region in
                    WorldClockItem(region: region)
                }
                .onDelete(perform: delete)
                .onMove(perform: move)
                .onLongPressGesture {}
            }
            .listStyle(.inset)
            .navigationTitle("World Clock")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement:.navigationBarTrailing) {
                    Button {
                        showingAddRegion.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddRegion){
                WorldClockAddRegion()
                    .environmentObject(modelData)
            }
        }
    }
    
    func delete(at offsets: IndexSet) {
        modelData.regions.remove(atOffsets: offsets)
    }
    
    func move(from source: IndexSet, to destination: Int) {
        modelData.regions.move(fromOffsets: source, toOffset: destination)
    }
}

struct WorldClockView_Previews: PreviewProvider {
    static var previews: some View {
        WorldClockView()
            .environmentObject(ModelData())
    }
}
