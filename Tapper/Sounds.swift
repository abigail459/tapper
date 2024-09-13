//
//  EachSound.swift
//  Tapper
//
//  Created by Abigail Lau on 13/9/24.
//

import SwiftUI

struct Sounds: View {
    var sound: Selection
    
    var body: some View {
        VStack {
            Text("You selected:")
            Text(sound.string)
                .font(.title)
                .bold()
        }
        .navigationTitle(sound.string)
    }
}

#Preview {
    Sounds(sound: .one) 
}
