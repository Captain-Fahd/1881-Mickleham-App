//
//  RegistrationView.swift
//  Mickleham_Musallah_App
//
//  Created by Omar Fahd on 28/2/2025.
//
import SwiftUI

struct RegistrationView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var showLoginScreen = false
    
    var body: some View {
        ZStack {
            Color(red: 1/255,  green: 200/255, blue: 139/255)
                .ignoresSafeArea()
            Circle()
                .foregroundColor(Color(red: 105/255, green: 250/255, blue: 210/255))
                .opacity(0.3)
                .frame(width: 600, height: 800)
            VStack {
                Text("Register")
                    .font(.largeTitle)
                    .bold()
                TextField("Username", text: $username)
                    .padding(20)
                    .frame(width: 250, height: 50)
                    .background(Color.black.opacity(0.1))
                    .cornerRadius(10)
                    .border(Color.red, width: CGFloat(wrongUsername))
                SecureField("Password", text: $password)
                    .padding(20)
                    .frame(width: 250, height: 50)
                    .background(Color.black.opacity(0.1))
                    .cornerRadius(10)
                    .border(Color.red, width: CGFloat(wrongPassword))
                Button("Register"){
                    
                }
                .foregroundColor(Color.white)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color(red: 1/255,  green: 200/255, blue: 139/255))
                        .frame(width: 250, height: 50)
                )
                .padding(.top, 20)
                .bold()
                .font(.title3)
            }
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white)
                    .frame(width: 300, height: 300)
                    
            )
            .multilineTextAlignment(.center)
            
        }
        
            
    }
}
