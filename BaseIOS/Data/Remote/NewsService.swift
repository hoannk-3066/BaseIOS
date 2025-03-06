//
//  NewsService.swift
//  BaseIOS
//
//  Created by Nguyen Khai Hoan on 12/3/25.
//

import RxSwift

protocol NewsService {
    func fetchNews() -> Single<NewsDTO>
}

struct NewsServiceImpl: NewsService {
    func fetchNews() -> Single<NewsDTO> {
        return NetworkManager.shared.request(APIRequest.getLastestData).asSingle()
    }
}
