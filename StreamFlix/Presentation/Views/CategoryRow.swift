//
//  CategoryRow.swift
//  StreamFlix
//
//  Created by Fayith  on 25/08/26.
//

import SwiftUI

struct CategoryRow: View {

    let category: Category
    let onSelect: (MediaItem) -> Void

    var body: some View {

        VStack(alignment: .leading, spacing: 20) {

            Text(category.title)
                .font(.title3)
                .bold()

            ScrollView(.horizontal) {

                LazyHStack(spacing: 35) {

                    ForEach(category.items) { item in

                        Button {
                            onSelect(item)
                        } label: {
                            MediaCard(item: item)
                        }
                    }
                }
            }
            .scrollClipDisabled()
        }
        .buttonStyle(.borderless)
    }
}
