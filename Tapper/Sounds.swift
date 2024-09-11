//
//  Sounds.swift
//  Tapper
//
//  Created by Abigail Lau on 26/8/24.
//

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
                VStack {
                    HStack{
                        EachSound(soundText: "Interactive guided meditation")
                        EachSound(soundText: "Nature sounds")
                    }
                    HStack{
                        EachSound(soundText: "White noise")
                        EachSound(soundText: "Soft music")
                    }
                    HStack{
                        EachSound(soundText: "Binaural sounds")
                        EachSound(soundText: "Custom music")
                    }
//                    EachSound(soundText: "Interactive guided meditation")
//                    EachSound(soundText: "Nature ounds")
//                    EachSound(soundText: "White noise")
//                    EachSound(soundText: "Soft music")
//                    EachSound(soundText: "Biaural sounds")
//                    EachSound(soundText: "Custom music")
                    Spacer()
                        .frame(height:200)
                }
                .padding(EdgeInsets(top: 200, leading: 100, bottom: 30, trailing: 100))
            }
            
        }
        .navigationDestination(for: Selection.self) { button in
            Sounds()
        }
    }
    
    func EachSound(soundText: String) -> some View {
        NavigationLink(value: soundText) {
            HStack {
                Text("\(soundText)")
                    .minimumScaleFactor(0.1)
                    .font(.system(size: 300))
                    .bold()
                    .frame(maxWidth: .infinity)
                    .frame(maxHeight: .infinity)
            }
            .padding(30)
            .background(Color.darkBlue)
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 16))
        }
        
        .buttonStyle(.plain)
    }

}

struct Sounds: View {
    var body: some View {
        Text("")
    }
}


#Preview {
    SoundsHome()
}
