//
//  CatalogAPIService.swift
//  StreamFlix
//
//  Created by Fayith  on 25/08/26.
//

import Foundation


protocol CatalogAPIService {
    func fetchCatalog() async throws -> CatalogResponseDTO
}

final class LocalCatalogAPIService: CatalogAPIService {

    func fetchCatalog() async throws -> CatalogResponseDTO {

        // Simulate network delay
        try await Task.sleep(for: .milliseconds(500))

        guard let url = Bundle.main.url(
            forResource: "catalog",
            withExtension: "json"
        ) else {
            throw URLError(.fileDoesNotExist)
        }

        let data = try Data(contentsOf: url)

        return try JSONDecoder().decode(
            CatalogResponseDTO.self,
            from: data
        )
    }
}
