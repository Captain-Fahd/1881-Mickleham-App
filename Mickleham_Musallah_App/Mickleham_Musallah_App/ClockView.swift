//
//  ClockView.swift
//  Mickleham_Musallah_App
//
//  Created by Omar Fahd on 21/2/2025.
//

import SwiftUI
struct ClockView: View {
    @State private var currentTime = ""
    
    
    var body: some View {
        Text(currentTime)
            .font(.largeTitle)
            .onAppear {
                startClock()
            }
    }
    func startClock() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            let formatter = DateFormatter()
            formatter.dateFormat = "hh:mm a"
            currentTime = formatter.string(from: Date())
        }
        
    }
    
}
