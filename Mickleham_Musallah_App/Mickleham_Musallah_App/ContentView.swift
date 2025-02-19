//
//  ContentView.swift
//  Mickleham_Musallah_App
//
//  Created by Omar Fahd on 18/2/2025.
//

import SwiftUI

 var prayers: [(prayer: String, time: String)] = [
    ("Fajr","06:00 am"),
    ("Dhuhr","02:10 pm"),
    ("Asr","05:40 pm"),
    ("Maghrib","08:18 pm"),
    ("Isha","09:48 pm")
]

struct TaskScheduler: View {
    @State private var nextPrayer = "Loading..."
    @State private var nextTime = "Loading..."
    
    var body: some View {
        VStack{
            Text("The next Iqamah is:")
                .font(.title)
            Text(nextPrayer + " at " + nextTime)
                .font(.largeTitle)
        }
        .onAppear{
            updatePrayer()
            Timer.scheduledTimer(withTimeInterval: 60, repeats: true) { _ in
                updatePrayer()
            }
        }
    }
    func updatePrayer() {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        
        
        let now = Date()
        let calendar = Calendar.current
        
        let prayerTimes = prayers.compactMap { (prayer, time) -> (Date, String)? in
            if let prayerTime = formatter.date(from: time) {
                let components = calendar.dateComponents([.hour, .minute], from: prayerTime)
                if let todayPrayerTime = calendar.date(bySettingHour: components.hour!, minute: components.minute!, second: 0, of: now) {
                    return (todayPrayerTime, prayer)
                }
            }
            return nil
        }
        
        if let upcomingPrayer = prayerTimes.first(where: { $0.0 > now}) {
            let formatter = DateFormatter()
            formatter.dateFormat = "hh:mm a"
            nextTime = formatter.string(from: upcomingPrayer.0)
            nextPrayer = upcomingPrayer.1
        } else {
            nextPrayer = prayers.first!.prayer
        }
        
    }
    
    
        }
        
    
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

struct HomeView: View {
    var body: some View {
        VStack{
            Text("1881 Mickleham Musallah")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
            //Clock & next prayer
            VStack(){
                Text("The time now is:")
                    .font(.title)
                ClockView()
            }
            .padding(.vertical, 20.0)
            
            TaskScheduler()
            Spacer()
        }
    }
}

struct ContentView: View {
    var body: some View {
        VStack(alignment: .center) {
            
            TabView {
                HomeView()
                    .tabItem {
                        Text("Home")
                    }
                    
                Text("Duas Screen")
                    .tabItem{
                        Text("Duas")
                    }
                Text("Settings screen")
                    .tabItem{
                        Text("Settings")
                    }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            
        }
    }
}
#Preview {
    ContentView()
}
