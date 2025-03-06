//
//  DetailViewController.swift
//  BaseIOS
//
//  Created by Hoàn Nguyễn on 3/6/25.
//

import UIKit

class DetailViewController: BaseViewController {
    let coordinator: DetailCoordinator
    let viewModel: DetailViewModel
    @IBOutlet weak var backButton: UIButton!
    
    init(coordinator: DetailCoordinator, viewModel: DetailViewModel) {
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
        let input = DetailViewModel.Input(trigger: backButton.rx.tap.asObservable())
        let output = viewModel.transform(input: input)
        
        output.goBack
            .driveNext {[weak self] _ in
                self?.coordinator.navigateBack()
            }.disposed(by: disposeBag)
        
        output.errorTracker
            .driveNext { error in
                print(error)
            }.disposed(by: disposeBag)
        
        output.activityIndicator
            .drive()
            .disposed(by: disposeBag)
    }
}
