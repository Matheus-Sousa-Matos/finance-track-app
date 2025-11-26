//
//  DIContainer.swift
//  finance-track-app
//
//  Created by Matheus de Sousa Matos on 25/11/25.
//

import Foundation

// MARK: - DIContainer
final class DIContainer {
    static let shared = DIContainer()
    
    let userDefaultsService: UserDefaultsServiceProtocol
    let appleAuthService: AppleAuthServiceProtocol
    let mockDataService: MockDataServiceProtocol //TODO: - Remover depois
    
    init(userDefaultsService: UserDefaultsServiceProtocol = UserDefaultsService(),
         appleAuthService: AppleAuthServiceProtocol = MockAppleAuthService(),
         mockDataService: MockDataServiceProtocol = MockDataService())
    {
        self.userDefaultsService = userDefaultsService
        self.appleAuthService = appleAuthService
        self.mockDataService = mockDataService
    }
    
}

// MARK: - Apple Auth (mock) - Mover para outro arquivo
protocol AppleAuthServiceProtocol {
    func signIn(completion: @escaping (Bool) -> Void)
}

final class MockAppleAuthService: AppleAuthServiceProtocol {
    func signIn(completion: @escaping (Bool) -> Void) {
        // simula autenticação assincrona
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            completion(true)
        }
    }
}

//TODO: - Remover depois
protocol MockDataServiceProtocol {
    var message: String { get }
}

final class MockDataService: MockDataServiceProtocol {
    let message = "Dados mockados carregados"
}
