//
//  StreamFlixApp.swift
//  StreamFlix
//
//  Created by Fayith  on 25/08/26.
//

import SwiftUI

@main
struct StreamFlixApp: App {

    private let viewModel: CatalogViewModel

    init() {

        let service = LocalCatalogAPIService()

        let repository = CatalogRepositoryImpl(
            service: service
        )

        let useCase = FetchCatalogUseCaseImpl(
            repository: repository
        )

        viewModel = CatalogViewModel(
            fetchCatalogUseCase: useCase
        )
    }

    var body: some Scene {
        WindowGroup {
            CatalogView(viewModel: viewModel)
        }
    }
}
