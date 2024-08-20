//
//  Welcome.swift
//  Tapper
//
//  Created by Abigail Lau on 15/7/24.
//

import SwiftUI

struct Welcome: View {
    @State private var isActive = false // State variable to control navigation

    var body: some View {
        NavigationStack {
            let font = "Avenir Book"
            ZStack() {
                Image("welcome")
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .edgesIgnoringSafeArea(.all)
                VStack() {
                    Text("Welcome to Tapper!")
                        .font(.custom(font, size: 35))
                        .foregroundStyle(.darkerBlue)
                    Spacer()
                        .frame(height: 70)
                    Text(" We are here to accompany you on your journey to finding peace. Our app offers a variety of tools and resources to help you manage anxiety, relieve stress, and improve your overall well-being. ")
                        .font(.custom(font, size: 22))
                        .foregroundStyle(.darkerBlue)
                        .multilineTextAlignment(.center)
                        .lineSpacing(6.0)
                        .padding()
                    Spacer()
                        .frame(height: 100)
                    NavigationLink ("Let's get started"){
                        Preferences()
                    }
                        .padding(18)
                        .font(.custom(font, size: 30))
                        .foregroundStyle(.white)
                        .background(.darkBlue)
                        .clipShape(RoundedRectangle(cornerRadius: 7))
                }
                .padding(16)
            }
            
        }
    }
}

#Preview {
    Welcome()
}
