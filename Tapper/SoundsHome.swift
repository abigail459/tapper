//
//  Sounds.swift
//  Tapper
//
//  Created by Abigail Lau on 26/8/24.
//

// sound credit:<a href="https://www.vecteezy.com/free-videos/forest-loop">Forest Loop Stock Videos by Vecteezy</a>

//Video by <a href="https://pixabay.com/users/lyn890709-22764594/?utm_source=link-attribution&utm_medium=referral&utm_campaign=video&utm_content=85590">Shirlyn Mun Lyn Tan</a> from <a href="https://pixabay.com//?utm_source=link-attribution&utm_medium=referral&utm_campaign=video&utm_content=85590">Pixabay</a>

// Video by Vecteezy from Pixabay
// Video by Shirlyn Mun Lyn Tan from Pixabay
// Video by Vimeo-Free-Videos from Pixabay
// Video by Tomislav Jakupec from Pixabay
// Video by Bakhtiyor Sayakulov from Pixabay

import SwiftUI

enum Selection: CaseIterable, Codable {
    case one, two, three, four, five, six
    
    var string: String {
        switch self {
        case .one:
            return "Guided meditation"
        case .two:
            return "Nature sounds"
        case .three:
            return "White noise"
        case .four:
            return "Soft music"
        case .five:
            return "Binaural sounds"
        case .six:
            return "Custom music"
        }
    }
}

struct SoundsHome: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Image("welcome")
                VStack(spacing: 15) {
                    ForEach(Selection.allCases, id: \.self) { sound in
                        EachSound(selection: sound)
                    }
                    Spacer()
                        .frame(height: 20)
                }
            }
        }
    }
    
    func EachSound(selection: Selection) -> some View {
        NavigationLink {
            Sounds(sound: selection)
        } label: {
            Text(selection.string)
                .padding(30)
                .bold()
                .foregroundStyle(.white)
                .font(.custom("Avenir Book", size: 140.0))
                .frame(width: UIScreen.main.bounds.width - 40.0, height: 80)
                .background(Image("buttonfill").resizable())
                .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 2)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .lineLimit(1)
                .minimumScaleFactor(0.2)
        }
        .buttonStyle(.plain)
    }
    
}

#Preview {
    SoundsHome()
}
