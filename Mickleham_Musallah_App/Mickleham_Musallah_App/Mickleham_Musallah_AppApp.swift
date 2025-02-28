//
//  Mickleham_Musallah_AppApp.swift
//  Mickleham_Musallah_App
//
//  Created by Omar Fahd on 19/2/2025.
//

import SwiftUI

@main
struct Mickleham_Musallah_AppApp: App {
    init(){
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(red: 37/255, green: 226/255, blue: 163/255, alpha: 1)
        
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    var body: some Scene {
        WindowGroup {
            RegistrationView()
        }
    }
}
