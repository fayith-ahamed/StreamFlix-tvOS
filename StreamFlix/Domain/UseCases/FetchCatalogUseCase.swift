//
//  FetchCatalogUseCase.swift
//  StreamFlix
//
//  Created by Fayith  on 25/08/26.
//

protocol FetchCatalogUseCase {
    func execute() async throws -> [Category]
}

final class FetchCatalogUseCaseImpl: FetchCatalogUseCase {

    private let repository: CatalogRepository

    init(repository: CatalogRepository) {
        self.repository = repository
    }

    func execute() async throws -> [Category] {
        try await repository.fetchCatalog()
    }
}
