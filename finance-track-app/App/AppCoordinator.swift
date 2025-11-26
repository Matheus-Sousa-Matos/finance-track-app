//
//  MainCoordinator.swift
//  finance-track-app
//
//  Created by Matheus de Sousa Matos on 25/11/25.
//

import UIKit

// MARK: - AppCoordinator
final class AppCoordinator: Coordinator {
    let window: UIWindow
    let navigationController: UINavigationController
    let container: DIContainer

    init(window: UIWindow, container: DIContainer) {
        self.window = window
        self.navigationController = UINavigationController()
        self.container = container
    }

    func start() {
        
        switch DevConfig.flowBypass {
        case .none:
            if container.userDefaultsService.isFirstLaunch {
                let onboarding = OnboardingCoordinator(navigationController: navigationController, container: container)
                onboarding.start()
            } else {
                let auth = AuthCoordinator(navigationController: navigationController, container: container)
                auth.start()
            }
        case .forceOnboarding:
            showOnboarding()
        case .forceAuth:
            showAppleAuth()
        }
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    private func showOnboarding() {
        let onboarding = OnboardingCoordinator(navigationController: navigationController, container: container)
        onboarding.start()
    }
    
    private func showAppleAuth() {
        let auth = AuthCoordinator(navigationController: navigationController, container: container)
        auth.start()
    }
    
    //TODO: - Verificar se sera mantido nesse local... 
    private func showHome() {
        let homeCoordinator = HomeCoordinator(navigationController: navigationController, container: container)
        homeCoordinator.start()
    }
    
}

