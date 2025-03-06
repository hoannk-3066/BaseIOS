//
//  ViewController.swift
//  BaseIOS
//
//  Created by nguyen.khai.hoan on 6/2/25.
//

import UIKit

class ViewController: BaseViewController {
    let coordinator: MainCoordinator
    let viewModel: ViewModel
    
    @IBOutlet weak var testButton: UIButton!
    
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
        let input = ViewModel.Input(trigger: testButton.rx.tap.asObservable())
        let output = viewModel.transform(input: input)
        output.empty
            .driveNext {[weak self] _ in
                self?.coordinator.showDetail()
            }.disposed(by: disposeBag)
    }
}

