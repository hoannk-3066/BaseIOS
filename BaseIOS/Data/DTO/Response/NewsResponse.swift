//
//  Untitled.swift
//  BaseIOS
//
//  Created by Nguyen Khai Hoan on 12/3/25.
//
import Foundation

struct NewsResponse: Codable {
    let articleID, title: String?
    let link: String?
    let keywords: [String]?
    let creator: [String]?
    let videoURL, description, content: String?
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
    
    enum CodingKeys: String, CodingKey {
        case articleID = "article_id"
        case title, link, keywords, creator
        case videoURL = "video_url"
        case description, content, pubDate, pubDateTZ
        case imageURL = "image_url"
        case sourceID = "source_id"
        case sourcePriority = "source_priority"
        case sourceName = "source_name"
        case sourceURL = "source_url"
        case sourceIcon = "source_icon"
        case language, country, category
        case aiTag = "ai_tag"
        case aiRegion = "ai_region"
        case aiOrg = "ai_org"
        case sentiment
        case sentimentStats = "sentiment_stats"
        case duplicate
    }
}

extension NewsResponse {
    func toEntity() -> NewsResultEntity {
        return NewsResultEntity(
            articleID: self.articleID,
            title: self.title,
            link: self.link,
            keywords: self.keywords ?? [],
            videoURL: self.videoURL,
            description: self.description,
            content: self.content,
            creator: self.creator,
            pubDate: self.pubDate,
            pubDateTZ: self.pubDateTZ,
            imageURL: self.imageURL,
            sourceID: self.sourceID,
            sourcePriority: self.sourcePriority,
            sourceName: self.sourceName,
            sourceURL: self.sourceURL,
            sourceIcon: self.sourceIcon,
            language: self.language,
            country: self.country,
            category: self.category,
            aiRegion: self.aiRegion,
            aiTag: self.aiTag,
            aiOrg: self.aiOrg,
            sentiment: self.sentiment,
            sentimentStats: self.sentimentStats,
            duplicate: self.duplicate
        )
    }
}
