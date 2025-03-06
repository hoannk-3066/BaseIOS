//
//  ViewModel.swift
//  BaseIOS
//
//  Created by Hoàn Nguyễn on 3/6/25.
//
import RxSwift
import RxCocoa

class ViewModel: BaseViewModelType{
    struct Input {
        let trigger: Observable<Void>
    }
    struct Output {
        let empty: Driver<Void>
    }
    
    func transform(input: Input) -> Output {
        let empty = input.trigger
        return Output(empty: empty.asDriverOnErrorJustComplete())
    }
}
