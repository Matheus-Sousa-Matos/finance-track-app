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
                
        let homeCoordinator = HomeCoordinator(navigationController: navigationController, container: container)
        homeCoordinator.start()
        
        //let onboardingCoordinator = OnboardingCoordinator(navigationController: navigationController)
        //onboardingCoordinator.start()

        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
