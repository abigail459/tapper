//
//  Sounds.swift
//  Tapper
//
//  Created by Abigail Lau on 26/8/24.
//

// sound credit:<a href="https://www.vecteezy.com/free-videos/forest-loop">Forest Loop Stock Videos by Vecteezy</a>

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
                .font(.custom("Arial", size: 140.0))
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
