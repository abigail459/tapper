//
//  Settings.swift
//  Tapper
//
//  Created by Abigail Lau on 20/8/24.
//

import SwiftUI

struct Settings: View {
    var body: some View {
        NavigationStack {
            ZStack {
                
                Image("welcome")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                VStack {
                    Text("Settings")
                        .font(.custom("Avenir Next Bold", size: 50.0))
                        .foregroundStyle(.darkerBlue)
                        .padding(.bottom, -20)
                    List {
                        NavigationLink(destination: CustomisationView()) {
                            Text("Customisation")
                        }
                        NavigationLink(destination: AcknowledgementsView()) {
                            Text("Acknowledgements")
                        }
                    }
                    .opacity(0.8)
                    .scrollContentBackground(.hidden)
                }
            }
        }
    }
}

struct CustomisationView: View {
    var body: some View {
        ZStack {
            Image("welcome")
        }
    }
}

struct AcknowledgementsView: View {
    var body: some View {
        List {
            Text("Video by Vecteezy from Pixabay")
            Text("Video by Shirlyn Mun Lyn Tan from Pixabay")
            Text("Video by Vimeo-Free-Videos from Pixabay")
            Text("Video by Tomislav Jakupec from Pixabay")
            Text("Video by Bakhtiyor Sayakulov from Pixabay")
        }
    }
}

#Preview {
    Settings()
}
