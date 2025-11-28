//
//  OnboardingCoordinator.swift
//  finance-track-app
//
//  Created by Matheus de Sousa Matos on 25/11/25.
//

import UIKit

// MARK: - OnboardingCoordinator
final class OnboardingCoordinator: Coordinator {
    internal let navigationController: UINavigationController
    private let container: DIContainer

    var onFinish: (() -> Void)?

    private let pages = [
        OnboardingPage(
            title: "Primeira Tela Onboarding",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            backgroundImageName: "placeholderOnboarding",
            buttonTitle: "next"
        ),
        OnboardingPage(
            title: "Segunda Tela Onboarding",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            backgroundImageName: "placeholderOnboarding",
            buttonTitle: "next"
        ),
        OnboardingPage(
            title: "Última tela Onboarding",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            backgroundImageName: "placeholderOnboarding",
            buttonTitle: "finish"
        )
    ]

    init(navigationController: UINavigationController, container: DIContainer) {
        self.navigationController = navigationController
        self.container = container
    }

    func start() {
        let viewModel = OnboardingViewModel(
            userDefaults: container.userDefaultsService,
            pages: pages
        )

        let vc = OnboardingViewController(viewModel: viewModel) { [weak self] in
            self?.onFinish?()
        }

        navigationController.setViewControllers([vc], animated: false)
    }
}
