//
//  CatalogDTO.swift
//  StreamFlix
//
//  Created by Fayith  on 25/08/26.
//

import Foundation

struct CatalogResponseDTO: Decodable {
    let categories: [CategoryDTO]
}

struct CategoryDTO: Decodable {
    let id: String
    let title: String
    let items: [MediaItemDTO]
}

struct MediaItemDTO: Decodable {
    let id: String
    let title: String
    let imageUrl: String
}

extension MediaItemDTO {
    func toDomain() -> MediaItem {
        MediaItem(
            id: id,
            title: title,
            imageURL: URL(string: imageUrl)
        )
    }
}

extension CategoryDTO {
    func toDomain() -> Category {
        Category(
            id: id,
            title: title,
            items: items.map { $0.toDomain() }
        )
    }
}
