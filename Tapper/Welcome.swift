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
            ZStack() {
                Image("welcome")
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .edgesIgnoringSafeArea(.all)
                VStack() {
                    Text("Welcome to Tapper!")
                        .font(.custom("Times New Roman", size: 40))
                        .foregroundStyle(.darkerBlue)
                    Spacer()
                        .frame(height: 70)
                    Text(" We are here to accompany you on your journey to finding peace. Our app offers a variety of tools and resources to help you manage anxiety, relieve stress, and improve your overall well-being. ")
                        .font(.custom("Times New Roman", size: 22))
                        .foregroundStyle(.darkerBlue)
                        .multilineTextAlignment(.center)
                        .lineSpacing(15.0)
                        .padding()
                    Spacer()
                        .frame(height: 100)
                    NavigationLink ("Let's get started"){
                        Preferences()
                    }
                        .padding(18)
                        .font(.custom("Iowan Old Style", size: 30))
                        .foregroundStyle(.white)
                        .background(.darkBlue)
                        .clipShape(RoundedRectangle(cornerRadius: 7))
                }
                
            }
        }
    }
}

#Preview {
    Welcome()
}
