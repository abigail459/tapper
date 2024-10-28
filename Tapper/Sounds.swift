//
//  EachSound.swift
//  Tapper
//
//  Created by Abigail Lau on 13/9/24.
//Music: https://www.chosic.com/free-music/all/


import SwiftUI
import AVKit
import AVFoundation


struct VideoPlayerView: UIViewControllerRepresentable {
    let player: AVPlayer

    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        controller.player = player
        controller.showsPlaybackControls = false
        controller.videoGravity = .resizeAspectFill
        return controller
    }

    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
    }
}

class AudioManager: ObservableObject {
    var audioPlayer: AVAudioPlayer?
    
    init() {
        setupAudioSession()
    }
    
    private func setupAudioSession() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [])
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("Failed to set up audio session: \(error.localizedDescription)")
        }
    }
    
    func playSound(filename: String, fileExtension: String) {
        guard let url = Bundle.main.url(forResource: filename, withExtension: fileExtension) else {
            print("Sound file not found.")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }
}



struct Sounds: View {
    @StateObject private var audioManager = AudioManager()
    var sound: Selection
    private var player: AVPlayer
    
    init(sound: Selection) {
        self.sound = sound
        print(sound.string)
        let url = Bundle.main.url(forResource: sound.string, withExtension: "mp4")!
        self.player = AVPlayer(url: url)
        self.player.isMuted = true // Mute the video for background
        self.player.actionAtItemEnd = .none
    }
    
    var body: some View {
        ZStack {
            VideoPlayerView(player: player)
                .edgesIgnoringSafeArea(.all)
        }
        .onAppear {
            player.play()
            NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player.currentItem, queue: .main) { _ in
                player.seek(to: .zero)
                player.play()
            }
            audioManager.playSound(filename: "Nature sounds", fileExtension: "mp3")
        }
        .onDisappear {
            NotificationCenter.default.removeObserver(self, name: .AVPlayerItemDidPlayToEndTime, object: player.currentItem)
        }
    }
}

#Preview {
    Sounds(sound: .one)
}
