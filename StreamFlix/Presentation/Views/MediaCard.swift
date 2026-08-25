//
//  MediaCard.swift
//  StreamFlix
//
//  Created by Fayith  on 25/08/26.
//

import SwiftUI

struct MediaCard: View {

    let item: MediaItem

    @Environment(\.isFocused) private var isFocused

    var body: some View {

        VStack(alignment: .leading, spacing: 12) {

            AsyncImage(url: item.imageURL) { phase in

                switch phase {

                case .empty:
                    ZStack {
                        Rectangle()
                            .fill(.gray.opacity(0.2))

                        ProgressView()
                    }

                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()

                case .failure:
                    ZStack {
                        Rectangle()
                            .fill(.gray.opacity(0.2))

                        Image(systemName: "photo")
                            .font(.largeTitle)
                    }

                @unknown default:
                    EmptyView()
                }
            }
            .frame(width: 400, height: 250)
            .clipShape(
                RoundedRectangle(cornerRadius: 12)
            )

            Text(item.title)
                .font(.subheadline)
                .lineLimit(1)
        }
        .frame(width: 400)
        .padding(8)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(
                    isFocused
                    ? Color.gray.opacity(0.08)
                    : Color.clear
                )
        )
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(
                    isFocused ? Color.gray : Color.clear,
                    lineWidth: 4
                )
        )
        .scaleEffect(isFocused ? 1.08 : 1.0)
        .shadow(
            color: isFocused
                ? Color.gray.opacity(0.35)
                : Color.clear,
            radius: 15
        )
        .animation(
            .easeInOut(duration: 0.2),
            value: isFocused
        )
    }
}
