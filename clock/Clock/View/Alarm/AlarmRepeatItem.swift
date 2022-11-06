//
//  AlarmRepeatItem.swift
//  Clock
//
//  Created by Jinho Choi on 2022/11/04.
//

import SwiftUI

struct AlarmRepeatItem: View {
    var text: String;
    @Binding var check: Bool;
    var body: some View {
        HStack{
            Text(text)
                .foregroundColor(.white)
            Spacer()
            if check == true {
                Image(systemName: "checkmark")
                    .foregroundColor(.orange)
            }
        }
    }
}

struct AlarmRepeatItem_Previews: PreviewProvider {
    static var previews: some View {
        AlarmRepeatItem(text: "Every Sunday", check: .constant(true))
            .preferredColorScheme(.dark)
    }
}
