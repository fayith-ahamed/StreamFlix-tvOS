//
//  CatalogRepository.swift
//  StreamFlix
//
//  Created by Fayith  on 25/08/26.
//

protocol CatalogRepository {
    func fetchCatalog() async throws -> [Category]
}
