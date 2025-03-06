//
//  BaseViewController.swift
//  BaseIOS
//
//  Created by Hoàn Nguyễn on 3/6/25.
//

import UIKit
import RxSwift
import RxCocoa

class BaseViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupBindings()
    }
    
    func setupViews() {}
    
    func setupBindings() {}
}
