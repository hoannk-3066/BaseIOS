//
//  NewsDTO.swift
//  BaseIOS
//
//  Created by Nguyen Khai Hoan on 12/3/25.
//

import Foundation

struct NewsDTO: Codable {
    let status: String?
    let totalResults: Int?
    let results: [NewsResponse]?
    let nextPage: String?
}

extension NewsDTO {
    func toEntity() -> NewsEntity {
        return NewsEntity(
            status: self.status,
            totalResults: self.totalResults,
            results: self.results?.map { $0.toEntity() },
            nextPage: self.nextPage)
    }
}
