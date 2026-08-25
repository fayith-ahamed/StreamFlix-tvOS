//
//  CatalogModels.swift
//  StreamFlix
//
//  Created by Fayith  on 25/08/26.
//

import Foundation

struct MediaItem: Identifiable, Hashable {
    let id: String
    let title: String
    let imageURL: URL?
}

struct Category: Identifiable {
    let id: String
    let title: String
    let items: [MediaItem]
}
