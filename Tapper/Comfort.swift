//
//  Preferences.swift
//  Tapper
//
//  Created by Abigail Lau on 15/7/24.
//

import SwiftUI

struct Comfort: View {
    @EnvironmentObject var overall: Overall
    @State private var isRatedToday = false
    @State private var showStars = true
    
    private func loadRating() {
        let currentDate = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        let todayKey = formatter.string(from: currentDate)
        if let savedRating = UserDefaults.standard.object(forKey: todayKey) as? Double {
            overall.rating = savedRating
            isRatedToday = true 
        } else {
            isRatedToday = false
        }
    }
    
    private func saveRating() {
        let currentDate = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        let todayKey = formatter.string(from: currentDate)
        UserDefaults.standard.set(overall.rating, forKey: todayKey)
        isRatedToday = true
    }
    
    var body: some View {
        NavigationStack {
            ZStack{
                Image("welcome")
                let font = "Avenir Book"
                VStack(spacing: 20){
                    Text("Comfort")
                        .font(.custom("Avenir Next Bold", size: 50.0))
                        .foregroundStyle(.darkerBlue)
                        .padding(EdgeInsets(top: isRatedToday == true ? -60 : 70, leading: 0, bottom: -5, trailing: 0))
                    
                    if !isRatedToday {
                        if showStars {
                            VStack {
                                Text("How do you feel today?")
                                    .font(.custom(font, size: 20.0))
                                    .foregroundStyle(.white)
                                    .bold()
                                HStack {
                                    ForEach(1..<6) { star in
                                        Image(systemName: Double(star) <= overall.rating ?? 0.0 ? "star.fill" : "star")
                                            .resizable()
                                            .frame(width: 40, height: 40)
                                            .foregroundStyle(Double(star) <= overall.rating ?? 0.0 ? .darkerBlue : .darkerBlue)
                                            .onTapGesture {
                                                overall.rating = Double(star)
                                                Task {
                                                    await delaySave() // Delay before showing thank you message
                                                }
                                            }
                                    }
                                }
                                
                                HStack {
                                    Text("Very anxious")
                                        .font(.custom(font, size: 15.0))
                                        .foregroundStyle(.white)
                                        .bold()
                                    
                                    Spacer()
                                        .frame(width:140)
                                    Text("Great")
                                        .font(.custom(font, size: 15.0))
                                        .foregroundStyle(.white)
                                        .bold()
                                    
                                }
                                .padding(.top, 1)
                            }
                            .padding(EdgeInsets(top: 20, leading: 40, bottom: 20, trailing: 40))
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.darkBlue)
                                    .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 2)
                            )
                        } else {
                            Text("Thank you for rating!")
                                .foregroundStyle(.white).bold()
                                .padding(EdgeInsets(top: 40, leading: 40, bottom: 40, trailing: 40))
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(.darkBlue)
                                        .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 2))
                        }
                    }
                    
                    HStack(spacing: 30) {
                        Button {
                            
                        } label: {
                            VStack{
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
                    .padding(.top, 10)
                    Spacer()
                        .frame(height: 400)
                    
                }
                
            }
            .onAppear {
                loadRating()
            }
            
        }
        
    }
    
    // Delay before showing "Thank you" message
    func delaySave() async {
        showStars = true // Initially show stars
        try? await Task.sleep(nanoseconds: 2_000_000_000) // 2-second delay
        showStars = false // Hide stars and show "Thank you" message
        saveRating()
    }
}

#Preview {
    Comfort()
}
