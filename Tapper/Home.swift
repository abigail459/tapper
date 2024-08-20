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
            let font = "Avenir Book"
            VStack {
                Text("Home")
                    .font(.custom("Avenir Next Bold", size: 50.0))
                    .foregroundStyle(.darkerBlue)
                Button {
                    
                } label: {
                    HStack {
                        Image("video.2")
                            .resizable()
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .frame(width: 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                        Text("Opt for an immersive experience with  videos that combine calming visuals and  narration.")
                            .font(.custom(font, size: 22))
                            .foregroundStyle(.darkerBlue)
                            .multilineTextAlignment(.center)
                            .lineSpacing(2.0)
                    }
                } .padding(.horizontal, 100)
                Button {
                    
                } label: {
                    HStack {
                        Image("comedy.2")
                            .resizable()
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .frame(width: 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                        Text("Enjoy curated comedy scenes that will bring a smile to your face and lighten your mood.")
                            .font(.custom(font, size: 22))
                            .foregroundStyle(.darkerBlue)
                            .multilineTextAlignment(.center)
                            .lineSpacing(2.0)
                    }

                }
                .padding(.horizontal, 100)
                Spacer()
                    .frame(height: 370)
                
            }
        }
        .toolbar {
            NavigationLink(destination: Settings()) {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .frame(width: 35, height: 35)
                    .tint(.darkerBlue)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
        
}

#Preview {
    Preferences()
}
