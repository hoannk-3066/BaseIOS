//
//  ViewController.swift
//  BaseIOS
//
//  Created by nguyen.khai.hoan on 6/2/25.
//

import UIKit
import RxSwift

class ViewController: BaseViewController {
    let coordinator: MainCoordinator
    let viewModel: ViewModel
    
    @IBOutlet weak var testButton: UIButton!
    
    deinit {
        print("deinit \(String(describing: self))")
    }
    
    init(coordinator: MainCoordinator, viewModel: ViewModel) {
        self.coordinator = coordinator
        self.viewModel = viewModel
        let nibName = String(describing: type(of: self))
        let bundle = Bundle(for: type(of: self))
        super.init(nibName: nibName, bundle: bundle)
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupBindings() {
        let input = ViewModel.Input(trigger: Observable.merge(testButton.rx.tap.asObservable()))
        let output = viewModel.transform(input: input)
        output.newsList
            .driveNext { result in
                print(result)
            }.disposed(by: disposeBag)
        
        output.errorTracker
            .driveNext { error in
                print(error)
            }.disposed(by: disposeBag)
    }
}

