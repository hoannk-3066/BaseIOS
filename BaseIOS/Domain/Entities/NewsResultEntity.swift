//
//  NewsResultEntity.swift
//  BaseIOS
//
//  Created by Nguyen Khai Hoan on 12/3/25.
//

import Foundation

struct NewsResultEntity {
    let articleID, title: String?
    let link: String?
    let keywords: [String]?
    let videoURL, description, content: String?
    let creator: [String]?
    let pubDate, pubDateTZ: String?
    let imageURL: String?
    let sourceID: String?
    let sourcePriority: Int?
    let sourceName: String?
    let sourceURL: String?
    let sourceIcon: String?
    let language: String?
    let country, category: [String]?
    let aiRegion: String?
    let aiTag: String?
    let aiOrg: String?
    let sentiment: String?
    let sentimentStats: String?
    let duplicate: Bool?
}
