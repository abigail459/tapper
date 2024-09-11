//
//  Preferences.swift
//  Tapper
//
//  Created by Abigail Lau on 15/7/24.
//

import SwiftUI

struct Comfort: View {
    @State private var rating = 0
    @State private var isRatedToday = false

    
    private func loadRating() {
            let currentDate = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd" // Store the rating based on the current day
            
            let todayKey = formatter.string(from: currentDate)
            if let savedRating = UserDefaults.standard.object(forKey: todayKey) as? Int {
                rating = savedRating
                isRatedToday = true // Hide rating input if already rated
            } else {
                isRatedToday = false
            }
        }
        
        private func saveRating() {
            let currentDate = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            
            let todayKey = formatter.string(from: currentDate)
            UserDefaults.standard.set(rating, forKey: todayKey)
            isRatedToday = true
        }


    var body: some View {
        ZStack{
            Image("welcome")
            let font = "Avenir Book"
            VStack(spacing: 20){
                Text("Comfort")
                    .font(.custom("Avenir Next Bold", size: 50.0))
                    .foregroundStyle(.darkerBlue)
                    .padding(EdgeInsets(top: isRatedToday == true ? -60 : 70, leading: 0, bottom: -5, trailing: 0))
                if !isRatedToday {
                    if rating == 0 {
                        VStack {
                            Text("How do you feel today?")
                                .font(.custom(font, size: 20.0))
                                .foregroundStyle(.white)
                                .bold()
                            HStack {
                                ForEach(1..<6) { star in
                                    Image(systemName: star <= rating ? "star.fill" : "star")
                                        .resizable()
                                        .frame(width: 40, height: 40)
                                        .foregroundStyle(star <= rating ? .darkerBlue : .darkerBlue)
                                        .onTapGesture {
                                            rating = star
                                            Task {
                                                await delaySave()
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
    func delaySave() async {
        try? await Task.sleep(nanoseconds: 3_000_000_000)
        saveRating()
    }
        
}

#Preview {
    Comfort()
}
