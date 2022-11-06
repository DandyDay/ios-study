//
//  AlarmAddView.swift
//  Clock
//
//  Created by Jinho Choi on 2022/10/31.
//

import SwiftUI

struct AlarmAddView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var modelData: ModelData
    @Binding var alarm: Alarm
    @State private var draftAlarm = Alarm.default
    var isAdding: Bool

    var body: some View {
        NavigationView {
            VStack {
                DatePicker("", selection: $alarm.time, displayedComponents: .hourAndMinute)
                    .datePickerStyle(.wheel)
                    .labelsHidden()
                List{
                    Section {
                        NavigationLink {
                            AlarmRepeatView(alarm: $alarm)
                        } label: {
                            HStack {
                                Text("Repeat")
                                Spacer()
                                Text(getAlarmRepeatedString(repeated: alarm.repeated))
                                    .foregroundColor(.secondary)
                            }
                        }
                        HStack {
                            Text("Label")
                            TextField("Alarm", text: $alarm.label)
                                .multilineTextAlignment(.trailing)
                            if !alarm.label.isEmpty {
                                Button {
                                    
                                } label: {
                                    Image(systemName: "multiply.circle.fill")
                                        .foregroundColor(Color(UIColor.opaqueSeparator))
                                        .padding(.trailing, -3)
                                }
                            }
                        }
                        NavigationLink {
                            
                        } label: {
                            HStack {
                                Text("Sound")
                                Spacer()
                                Text("Radar")
                                    .foregroundColor(.secondary)
                            }
                        }
                        HStack {
                            Toggle("Snooze", isOn: $alarm.snooze)
                        }
                    }
                    Section {
                        if isAdding != true {
                            Button {
                                
                                presentationMode.wrappedValue.dismiss()

                            } label: {
                                HStack {
                                    Spacer()
                                    Text("Delete Alarm")
                                        .foregroundColor(.red)
                                    Spacer()
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle(isAdding ? "Add Alarm" : "Edit Alarm")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("Cancel")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        if isAdding == true {
                            modelData.alarms.append(alarm)
                            alarm = Alarm.default
                        } else {
                            //save
                        }
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("Save")
                            .fontWeight(.bold)
                    }
                }
            }
        }
    }
}

struct AlarmAddView_Previews: PreviewProvider {
    static var previews: some View {
        AlarmAddView(alarm: .constant(Alarm.default), isAdding: false)
            .environmentObject(ModelData())
    }
}
