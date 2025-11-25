//
//  HomeCoordinator.swift
//  finance-track-app
//
//  Created by Matheus de Sousa Matos on 25/11/25.
//

import UIKit

final class HomeCoordinator: Coordinator {
    var navigationController: UINavigationController
    let container: DIContainer

    init(navigationController: UINavigationController, container: DIContainer) {
        self.navigationController = navigationController
        self.container = container
    }
    
    func start() {
        // Criação do ViewModel usando o serviço vindo do container
        let viewModel = HomeViewModel(mockService: container.mockDataService)
        let vc = HomeViewController(viewModel: viewModel)
        navigationController.setViewControllers([vc], animated: false)
    }
}

