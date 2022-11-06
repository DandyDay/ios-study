//
//  TimePicker.swift
//  Clock
//
//  Created by Jinho Choi on 2022/11/01.
//

import SwiftUI

struct TimePicker: View {
    @Binding var pickerSelections: [Int]
    
    private let data: [[String]] = [
        Array(0...23).map { "\($0)" },
        Array(0...59).map { "\($0)" },
        Array(0...59).map { "\($0)" }
    ]
    
    var body: some View {
        HStack {
            PickerView(data: data, selections: self.$pickerSelections)
        }
    }
}

struct PickerView: UIViewRepresentable {
    var data: [[String]]
    @Binding var selections: [Int]
    
    //makeCoordinator()
    func makeCoordinator() -> PickerView.Coordinator {
        Coordinator(self)
    }
    
    //makeUIView(context:)
    func makeUIView(context: UIViewRepresentableContext<PickerView>) -> UIPickerView {
        
        let hoursLabel = UILabel()
        let minLabel = UILabel()
        let secLabel = UILabel()
        hoursLabel.text = "h"
        minLabel.text = "m"
        secLabel.text = "s"
        
        let picker = UIPickerView(frame: CGRect(x: 0, y: 0, width: 100, height: 100)) //doesnt work
        
        picker.dataSource = context.coordinator
        picker.delegate = context.coordinator
                
        return picker
    }
    
    //updateUIView(_:context:)
    func updateUIView(_ view: UIPickerView, context: UIViewRepresentableContext<PickerView>) {
        for i in 0...(self.selections.count - 1) {
            if(context.coordinator.initialSelection[i] != self.selections[i]){
                view.selectRow(self.selections[i], inComponent: i, animated: false)
                context.coordinator.initialSelection[i] = self.selections[i]
            }
        }
    }
    
    class Coordinator: NSObject, UIPickerViewDataSource, UIPickerViewDelegate {
        var parent: PickerView
        var initialSelection = [-1, -1, -1]
        
        //init(_:)
        init(_ pickerView: PickerView) {
            
            self.parent = pickerView
        }
        
        //numberOfComponents(in:)
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return self.parent.data.count
        }
        
        //pickerView(_:numberOfRowsInComponent:)
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return self.parent.data[component].count
        }
        
        func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
            return 50
        }
        
        //pickerView(_:titleForRow:forComponent:)
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return self.parent.data[component][row]
        }
        
        //pickerView(_:didSelectRow:inComponent:)
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            self.parent.selections[component] = row
        }
    }
}

struct TimePicker_Previews: PreviewProvider {
    static var previews: some View {
        TimePicker(pickerSelections: .constant([0,10,0]))
    }
}
