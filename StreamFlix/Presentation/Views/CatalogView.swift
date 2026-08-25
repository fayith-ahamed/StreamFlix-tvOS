//
//  CatalogView.swift
//  StreamFlix
//
//  Created by Fayith  on 25/08/26.
//

import SwiftUI

struct CatalogView: View {

    @StateObject private var viewModel: CatalogViewModel

    @State private var selectedItem: MediaItem?

    init(viewModel: CatalogViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {

        ZStack {

            Color.black
                .ignoresSafeArea()

            switch viewModel.state {

            case .idle, .loading:
                LoadingView()

            case .failed(let message):
                ErrorView(
                    message: message,
                    retry: {
                        Task {
                            await viewModel.loadCatalog()
                        }
                    }
                )

            case .loaded:

                
                VStack(alignment: .leading, spacing: 35){
                    
                    
                    Text("StreamFlix")
                        .font(.largeTitle)
                        .foregroundStyle(Color.red)
                        .bold()
                    ScrollView(.vertical) {

                        LazyVStack(
                            alignment: .leading,
                            spacing: 50
                        ) {

                            ForEach(viewModel.categories) { category in

                                CategoryRow(
                                    category: category
                                ) { item in

                                    selectedItem = item
                                }
                            }
                        }
                        .padding(.horizontal, 70)
                        .padding(.vertical, 50)
                    }
//                    .scrollClipDisabled()
                }
            }
        }
        .task {
            await viewModel.loadCatalog()
        }
        .fullScreenCover(item: $selectedItem) { item in
            DetailView(item: item)
        }
    }
}
