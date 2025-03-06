//
//  DIConfig.swift
//  BaseIOS
//
//  Created by Hoàn Nguyễn on 3/10/25.
//

class DIConfig {
    static func register(isTest: Bool = false) {
        guard !isTest else {
//            registerMock
            return
        }
        registerServices()
        registerRepositories()
        registerUseCases()
    }
    
    private static func registerServices() {
        let di = DIContainer.shared
        di.register(NewsServiceImpl(), for: NewsService.self)
    }
    
    private static func registerRepositories() {
        let di = DIContainer.shared
        di.register(NewsRepositoryImpl(), for: NewsRepository.self)
    }
    
    private static func registerUseCases() {
        let di = DIContainer.shared
        di.register(NewsUseCaseImpl(), for: NewsUseCase.self)
    }
}
