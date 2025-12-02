//
//  MainCoordinator.swift
//  finance-track-app
//
//  Created by Matheus de Sousa Matos on 25/11/25.
//

import UIKit

// MARK: - AppCoordinator
final class AppCoordinator: Coordinator {
    private let window: UIWindow
    internal let navigationController: UINavigationController
    private let container: DIContainer
    private let flowDecider: FlowDecider
    private var currentCoordinator: Coordinator?

    init(window: UIWindow, container: DIContainer, flowDecider: FlowDecider? = nil) {
        self.window = window
        self.navigationController = UINavigationController()
        self.container = container
        self.flowDecider = flowDecider ?? DefaultFlowDecider(userDefaults: container.userDefaultsService)
    }

    func start() {
        switch flowDecider.initialFlow() {
        case .onboarding: showOnboarding()
        case .auth: showAppleAuth()
        case .home: showHome()
        }

        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }

    // MARK: - Private Helpers
    private func startCoordinator(_ coordinator: Coordinator) {
        currentCoordinator = coordinator
        coordinator.start()
    }

    private func showOnboarding() {
        let onboarding = OnboardingCoordinator(
            navigationController: navigationController,
            container: container
        )
        onboarding.onFinish = { [weak self] in
            self?.showAppleAuth()
        }
        startCoordinator(onboarding)
    }

    private func showAppleAuth() {
        let auth = AuthCoordinator(
            navigationController: navigationController,
            container: container
        )
        startCoordinator(auth)
    }

    private func showHome() {
        let homeCoordinator = HomeCoordinator(
            navigationController: navigationController,
            container: container
        )
        startCoordinator(homeCoordinator)
    }
}



// MARK: - AppFlow
enum AppFlow {
    case onboarding
    case auth
    case home
}

// MARK: - FlowDecider Protocol
protocol FlowDecider {
    func initialFlow() -> AppFlow
}

// MARK: - DefaultFlowDecider
final class DefaultFlowDecider: FlowDecider {
    private let userDefaults: UserDefaultsServiceProtocol
    private let config: DevConfig.Type

    init(userDefaults: UserDefaultsServiceProtocol, config: DevConfig.Type = DevConfig.self) {
        self.userDefaults = userDefaults
        self.config = config
    }

    func initialFlow() -> AppFlow {
        switch config.flowBypass {
        case .none:
            return userDefaults.isFirstLaunch ? .onboarding : .auth
        case .forceOnboarding:
            return .onboarding
        case .forceAuth:
            return .auth
        }
    }
}
