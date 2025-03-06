//
//  NewsRepositoryImpl.swift
//  BaseIOS
//
//  Created by Nguyen Khai Hoan on 12/3/25.
//

import RxSwift

protocol NewsRepository {
    func fetchNews() -> Single<NewsEntity>
}
