//
//  CatalogRepositoryImpl.swift
//  StreamFlix
//
//  Created by Fayith  on 25/08/26.
//

final class CatalogRepositoryImpl: CatalogRepository {

    private let service: CatalogAPIService

    init(service: CatalogAPIService) {
        self.service = service
    }

    func fetchCatalog() async throws -> [Category] {

        let response = try await service.fetchCatalog()

        return response.categories.map {
            $0.toDomain()
        }
    }
}
