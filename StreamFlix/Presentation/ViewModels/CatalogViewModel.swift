//
//  CatalogViewModel.swift
//  StreamFlix
//
//  Created by Fayith  on 25/08/26.
//

import Foundation
import Combine

@MainActor
final class CatalogViewModel: ObservableObject {

    enum State {
        case idle
        case loading
        case loaded
        case failed(String)
    }

    @Published private(set) var state: State = .idle
    @Published private(set) var categories: [Category] = []

    private let fetchCatalogUseCase: FetchCatalogUseCase

    init(fetchCatalogUseCase: FetchCatalogUseCase) {
        self.fetchCatalogUseCase = fetchCatalogUseCase
    }

    func loadCatalog() async {

        state = .loading

        do {
            categories = try await fetchCatalogUseCase.execute()
            state = .loaded
        } catch {
            state = .failed(error.localizedDescription)
        }
    }
}
