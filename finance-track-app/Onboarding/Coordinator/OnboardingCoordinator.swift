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
            title: "Understand your expenses",
            description: "See where every penny goes and gain clarity about your finances.",
            backgroundImageName: "Wallet",
            buttonTitle: "next"
        ),
        OnboardingPage(
            title: "Set your goals",
            description: "Create financial goals and track your progress in a simple and motivating way.",
            backgroundImageName: "PiggyBank",
            buttonTitle: "next"
        ),
        OnboardingPage(
            title: "Take control",
            description: "With intelligent reports and personalized insights, you make better decisions every day.",
            backgroundImageName: "Budget",
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
