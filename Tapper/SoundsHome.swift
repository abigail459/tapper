//
//  Sounds.swift
//  Tapper
//
//  Created by Abigail Lau on 26/8/24.
//

// sound credit: https://www.chosic.com/free-music/nature/

import SwiftUI

enum Selection: CaseIterable, Codable {
    case one, two, three, four, five, six
    
    var string: String {
        switch self {
        case .one:
            return "Interactive guided meditation"
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
            ZStack{
                Image("welcome")
                VStack (spacing: 15) {
//                    HStack{
//                        EachSound(soundText: "Interactive guided meditation")
//                        EachSound(soundText: "Nature sounds")
//                    }
//                    HStack{
//                        EachSound(soundText: "White noise")
//                        EachSound(soundText: "Soft music")
//                    }
//                    HStack{
//                        EachSound(soundText: "Binaural sounds")
//                        EachSound(soundText: "Custom music")
//                    }
                    EachSound(soundText: "Interactive guided meditation")
                    EachSound(soundText: "Nature sounds")
                    EachSound(soundText: "White noise")
                    EachSound(soundText: "Soft music")
                    EachSound(soundText: "Biaural sounds")
                    EachSound(soundText: "Custom music")
                    Spacer()
                        .frame(height:200)
                }
                .padding(EdgeInsets(top: 200, leading: 100, bottom: 30, trailing: 100))
            }
            
        }
        .navigationDestination(for: Selection.self) { button in
            Sounds(sound: Selection.one)
        }
    }
    
    func EachSound(soundText: String) -> some View {
        NavigationLink(value: soundText) {
            HStack {
                Text("\(soundText)")
                    .minimumScaleFactor(0.2)
                    .font(.system(size: 140))
                    .bold()
                    .frame(maxWidth: .infinity)
                    .frame(maxHeight: 20)
                    
            }
            .padding(30)
            .background(Image("buttonfill"))
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 2)
        }
        
        .buttonStyle(.plain)
    }

}


#Preview {
    SoundsHome()
}
