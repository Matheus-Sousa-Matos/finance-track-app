//
//  UserDefaultsService.swift
//  finance-track-app
//
//  Created by Matheus de Sousa Matos on 26/11/25.
//

import Foundation

// MARK: - UserDefaults service
protocol UserDefaultsServiceProtocol {
    var isFirstLaunch: Bool { get }
    func markOnboardingAsSeen()
}

final class UserDefaultsService: UserDefaultsServiceProtocol {
    private let key = "onboarding_seen_v1" // versão da chave
    var isFirstLaunch: Bool { !UserDefaults.standard.bool(forKey: key) }
    
    func markOnboardingAsSeen() {
        UserDefaults.standard.set(true, forKey: key)
    }
}
