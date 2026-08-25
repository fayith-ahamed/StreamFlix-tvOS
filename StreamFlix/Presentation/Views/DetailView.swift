//
//  DetailView.swift
//  StreamFlix
//
//  Created by Fayith  on 25/08/26.
//

import SwiftUI

struct DetailView: View {

    let item: MediaItem

    @Environment(\.dismiss) private var dismiss

    @State private var showPlayer = false

    var body: some View {

        ZStack {

            Color.black
                .ignoresSafeArea()

            VStack(
                alignment: .leading,
                spacing: 30
            ) {

                AsyncImage(url: item.imageURL) { image in

                    image
                        .resizable()
                        .scaledToFit()

                } placeholder: {

                    ProgressView()
                        .scaleEffect(0.7)
                }
                .frame(
                    width: 700,
                    height: 390
                )

                Text(item.title)
                    .font(.largeTitle)
                    .bold()

                Text(
                    "A thrilling StreamFlix experience."
                )
                .font(.title3)
                .foregroundStyle(.secondary)

                Button("Play") {
                    showPlayer = true
                }
                .buttonStyle(.borderedProminent)
            }
            .padding(80)
        }
        .fullScreenCover(isPresented: $showPlayer) {
            PlayerView(item: item)
        }
    }
}
