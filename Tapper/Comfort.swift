//
//  Preferences.swift
//  Tapper
//
//  Created by Abigail Lau on 15/7/24.
//

import SwiftUI

struct Comfort: View {
    var body: some View {
        ZStack{
            Image("welcome")
            let font = "Avenir Book"
            VStack{
                Text("Comfort")
                    .font(.custom("Avenir Next Bold", size: 50.0))
                    .foregroundStyle(.darkerBlue)
                
                HStack {
                    Button {
                        
                    } label: {
                        VStack {
                            Image("video.2")
                                .resizable()
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .frame(width: 100, height: 100)
                            Text("Video")
                                .font(.custom(font, size: 20.0))
                                .foregroundStyle(.darkBlue)
                                .bold()
                        }
                    } .padding(.horizontal, 20)
                    
                    Button {
                        
                    } label: {
                        VStack {
                            Image("comedy.2")
                                .resizable()
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .frame(width: 100, height: 100)
                            Text("Comedy")
                                .font(.custom(font, size: 20.0))
                                .foregroundStyle(.darkBlue)
                                .bold()
                            
                        }
                        
                    } .padding(.horizontal, 20)
                    
                }
                Spacer()
                    .frame(height: 500)
            
            }
            .padding(7)
        }
        
    }
        
}

#Preview {
    Comfort()
}
