//
//  NewsUseCase.swift
//  BaseIOS
//
//  Created by Nguyen Khai Hoan on 12/3/25.
//

import RxSwift

protocol NewsUseCase {
    func fetchNews() -> Single<NewsEntity>
}

class NewsUseCaseImpl: NewsUseCase {
    @Injected
    private var newsRepository: NewsRepository
    
    func fetchNews() -> Single<NewsEntity> {
        return newsRepository.fetchNews()
    }
}
