//
//  Preferences.swift
//  Tapper
//
//  Created by Abigail Lau on 15/7/24.
//

import SwiftUI

struct Preferences: View {
    var body: some View {
        ZStack{
            Image("welcome")
            VStack {
                Button {
                    
                } label: {
                    HStack {
                        Image("video")
                            .resizable()
                            .frame(width: 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                        Text("Opt for an immersive experience with  videos that combine calming visuals and  narration.")
                            .font(.custom("Times New Roman", size: 22))
                            .foregroundStyle(.darkerBlue)
                            .multilineTextAlignment(.center)
                            .lineSpacing(10.0)
                    }
                }.padding(.horizontal, 100.0)
                Button {
                    
                } label: {
                    HStack {
                        Image("comedy")
                            .resizable()
                            .frame(width: 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                        Text("Enjoy curated comedy scenes that will bring a smile to your face and lighten your mood.")
                            .font(.custom("Times New Roman", size: 22))
                            .foregroundStyle(.darkerBlue)
                            .multilineTextAlignment(.center)
                            .lineSpacing(10.0)
                    }

                }
                .padding(.horizontal, 95.0)
                
            }
        }
        .navigationBarBackButtonHidden(true)
    }
        
}

#Preview {
    Preferences()
}
