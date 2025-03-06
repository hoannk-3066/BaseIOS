//
//  MainCoordinator.swift
//  BaseIOS
//
//  Created by Hoàn Nguyễn on 3/6/25.
//

import UIKit

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = ViewControllerFactory.makeMainViewController(coordinator: self)
        navigationController.setViewControllers([viewController], animated: false)
    }
    
    func showDetail() {
        let detailCoordinator = DetailCoordinator(navigationController: navigationController)
        detailCoordinator.start()
    }
}
