//
//  AuthCoordinator.swift
//  finance-track-app
//
//  Created by Matheus de Sousa Matos on 26/11/25.
//

import UIKit

// MARK: - AuthCoordinator
final class AuthCoordinator: Coordinator {
    let navigationController: UINavigationController
    let container: DIContainer

    init(navigationController: UINavigationController, container: DIContainer) {
        self.navigationController = navigationController
        self.container = container
    }

    func start() {
        let viewModel = AuthViewModel(appleAuthService: container.appleAuthService)
        let vc = AuthViewController(viewModel: viewModel) { [weak self] success in
            guard success, let self = self else { return }
            print("Success tapped auth")
            let home = HomeCoordinator(navigationController: self.navigationController, container: self.container)
            home.start()
        }
        navigationController.setViewControllers([vc], animated: false)
    }
}
