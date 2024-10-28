//
//  Tracker.swift
//  Tapper
//
//  Created by Abigail Lau on 26/8/24.
//

import SwiftUI
import Charts

struct Day: Identifiable {
    let id = UUID()
    let date: Date
    let value: Double
}

struct Tracker: View {
    @EnvironmentObject var overall: Overall
    
    var maxRating: Double = 10.0
    var body: some View {
        ZStack{
            Image("welcome")
            VStack {
                Text("Today")
                    .font(.custom("Avenir Next Bold", size: 50.0))
                    .foregroundStyle(.darkerBlue)
                    .padding(.bottom, -5)
                
                ZStack {
                    Image(systemName: "star.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250, height: 250)
                        .foregroundColor(.darkerBlue)
                        .overlay(
                            GeometryReader { geometry in
                                let width = geometry.size.width
                                let fillWidth = width * ((overall.rating ?? 0.0) / maxRating)
                                
                                ZStack() {
                                    Rectangle()
                                        .fill(Color.white)
                                        .frame(width: overall.rating == 4.0 ? fillWidth - 20 : fillWidth)
                                        .frame(width: width, alignment: .leading)

                                }
                                .rotationEffect(.degrees(-90))
                                .mask(Image(systemName: "star.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 250, height: 200))
                            }
                            
                        )
                    Image(systemName: "star")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250, height:250)
                        .foregroundColor(.staroutline)
                    
                }
                Spacer()
                    .frame(height: 400)
            }
            
            
        }
        
    }
    
}

#Preview {
    Tracker()
}
