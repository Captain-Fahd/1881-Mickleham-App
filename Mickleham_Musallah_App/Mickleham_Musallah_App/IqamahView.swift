//
//  IqamahView.swift
//  Mickleham_Musallah_App
//
//  Created by Omar Fahd on 21/2/2025.
//

import SwiftUI

struct IqamahView: View {
    
    var body: some View {
        Text("Iqamah Times:")
            .font(.system(size:32))
        VStack{
            ForEach(prayers.indices, id:\.self) { index in
                HStack{
                    Text(prayers[index].prayer)
                    Image(systemName: prayers[index].icon)
                    Divider()
                    Spacer()
                    Text(prayers[index].time)
                }
                .frame(maxWidth: 300, maxHeight: 170)
            }
        }
        .font(.system(size:20))
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(red: 37/255, green: 226/255, blue: 163/255))
                .frame(width: 360, height: 200)
            
        )
    }
}
