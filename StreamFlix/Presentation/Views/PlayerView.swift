//
//  PlayerView.swift
//  StreamFlix
//
//  Created by Fayith  on 25/08/26.
//

import SwiftUI

struct PlayerView: View {

    let item: MediaItem

    @Environment(\.dismiss) private var dismiss

    @State private var progress = 0.35
    @State private var isPlaying = true

    var body: some View {

        ZStack {

            Color.black
                .ignoresSafeArea()

            VStack(spacing: 30) {

                Image(systemName:
                    isPlaying
                    ? "pause.circle.fill"
                    : "play.circle.fill"
                )
                .font(.system(size: 100))

                Text(item.title)
                    .font(.largeTitle)
                    .bold()

                ProgressView(value: progress)
                    .frame(width: 700)

                Button(
                    isPlaying ? "Pause" : "Play"
                ) {
                    isPlaying.toggle()
                }
                .buttonStyle(.borderedProminent)

                Button("Close") {
                    dismiss()
                }
            }
        }
    }
}
