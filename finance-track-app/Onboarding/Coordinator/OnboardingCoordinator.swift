//
//  OnboardingCoordinator.swift
//  finance-track-app
//
//  Created by Matheus de Sousa Matos on 25/11/25.
//

import UIKit

// MARK: - OnboardingCoordinator
final class OnboardingCoordinator: Coordinator {
    let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = OnboardingViewController()
        navigationController.setViewControllers([vc], animated: false)
    }
}
