//
//  AlarmView.swift
//  Clock
//
//  Created by Jinho Choi on 2022/10/31.
//

import SwiftUI

struct AlarmView: View {
    @State private var showingAddAlarm = false
    @EnvironmentObject var modelData: ModelData
    @State private var showingModifyAlarm = false
    @State private var tempAlarm = Alarm.default
    @State private var editIndex: Int = 0
    
    var body: some View {
        NavigationView {
            List {
                HStack {
                    Image(systemName: "bed.double.fill")
                        .padding(.trailing, -5)
                    Text("Sleep | Wake Up")
                        .font(.title3)
                }
                .fontWeight(.bold)
                .foregroundColor(.white)
                AlarmSleepItem(alarm: Alarm.default)
                if modelData.alarms.count != 0 {
                    Text("Other")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    ForEach(modelData.alarms.indices, id:\.self) { index in
                        Button {
                            showingModifyAlarm.toggle()
                            editIndex = index
                        } label: {
                            AlarmItem(alarm: $modelData.alarms[index])
                        }
                        .sheet(isPresented: $showingModifyAlarm){
                            AlarmAddView(alarm: $modelData.alarms[editIndex], isAdding: false)
                        }
                    }
                    .onDelete(perform: delete)
                    
                }
            }
            .listStyle(.inset)
            .navigationTitle("Alarm")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement:.navigationBarTrailing) {
                    Button {
                        showingAddAlarm.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddAlarm){
                AlarmAddView(alarm: $tempAlarm, isAdding: true)
            }
        }
    }
    
    func delete(at offsets: IndexSet) {
        modelData.alarms.remove(atOffsets: offsets)
    }

}

struct AlarmView_Previews: PreviewProvider {
    static var previews: some View {
        AlarmView()
            .environmentObject(ModelData())
    }
}
