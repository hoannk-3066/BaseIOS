//
//  NewsRepositoryImpl.swift
//  BaseIOS
//
//  Created by Nguyen Khai Hoan on 12/3/25.
//

import RxSwift

class NewsRepositoryImpl: NewsRepository {
    @Injected
    private var newsService: NewsService
    
    func fetchNews() -> Single<NewsEntity> {
        return newsService.fetchNews().map { $0.toEntity() }
    }
}
