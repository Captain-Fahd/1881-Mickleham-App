//
//  TaskScheduler.swift
//  Mickleham_Musallah_App
//
//  Created by Omar Fahd on 21/2/2025.
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
       .frame(width: 350.0, height: 100)
       .background(
           RoundedRectangle(cornerRadius: 25)
               .fill(Color(red: 1/255,  green: 200/255, blue: 139/255))
                   .shadow(radius: 20)
       )
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
