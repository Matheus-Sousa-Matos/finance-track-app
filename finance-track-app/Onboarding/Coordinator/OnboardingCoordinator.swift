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
    let container: DIContainer

    init(navigationController: UINavigationController, container: DIContainer) {
        self.navigationController = navigationController
        self.container = container
    }

    func start() {
        let viewModel = OnboardingViewModel(userDefaults: container.userDefaultsService)
        let vc = OnboardingViewController(viewModel: viewModel) { [weak self] in
            // ao completar onboarding, passamos para AuthCoordinator (não pop, trocamos root do nav)
            guard let self = self else { return }
            let auth = AuthCoordinator(navigationController: self.navigationController, container: self.container)
            auth.start()
        }
        navigationController.setViewControllers([vc], animated: false)
    }
    
}
