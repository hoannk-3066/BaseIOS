//
//  ViewModel.swift
//  BaseIOS
//
//  Created by Hoàn Nguyễn on 3/6/25.
//
import RxSwift
import RxCocoa

class ViewModel: BaseViewModelType{
    @Injected
    private var useCase: NewsUseCase
    
    let errorTracker = ErrorTracker()

    func transform(input: Input) -> Output {
        let newsList = input.trigger
            .flatMapLatest {[weak self] _ -> Single<[NewsResultEntity]> in
                guard let self = self else { return Single.just([]) }
                return self.useCase.fetchNews()
                    .map { $0.results ?? [] }
            }.trackError(errorTracker)
        return Output(newsList: newsList.asDriverOnErrorJustComplete(),
                      errorTracker: errorTracker)
    }
}

extension ViewModel {
    struct Input {
        let trigger: Observable<Void>
    }
    struct Output {
        let newsList: Driver<[NewsResultEntity]>
        let errorTracker: ErrorTracker
    }
}
