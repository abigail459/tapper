//
//  ContentView.swift
//  Tapper
//
//  Created by Abigail Lau on 12/7/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Comfort()
                .tabItem {
                    Label("Comfort", systemImage: "leaf.fill")
                }
            SoundsHome()
                .tabItem {
                    Label("Sounds", systemImage: "music.quarternote.3")
                }
            Tracker()
                .tabItem {
                    Label("Tracker", systemImage: "circle.hexagonpath")
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
        .tint(.darkerBlue)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ContentView()
}
