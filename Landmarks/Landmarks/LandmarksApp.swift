//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Jinho Choi on 2022/10/30.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
