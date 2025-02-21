//
//  HomeView.swift
//  Mickleham_Musallah_App
//
//  Created by Omar Fahd on 21/2/2025.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView{
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
                IqamahView()
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 99/255, green: 242/255, blue: 189/255))
    }
}

