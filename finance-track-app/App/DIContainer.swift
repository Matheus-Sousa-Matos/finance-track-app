//
//  DIContainer.swift
//  finance-track-app
//
//  Created by Matheus de Sousa Matos on 25/11/25.
//

// MARK: - DIContainer
final class DIContainer {
    static let shared = DIContainer()
    
    // Serviços vazios temporários
    let authService: AuthServiceProtocol

    //MARK: - Remove before
    // Serviço de teste de injeção de dependência.
    let mockDataService: MockDataServiceProtocol
    
    init(authService: AuthServiceProtocol = AuthService(),
         mockDataService: MockDataServiceProtocol = MockDataService()) {
        self.authService = authService
        self.mockDataService = mockDataService
    }
    
}

// MARK: - Serviços base (placeholders)
protocol AuthServiceProtocol {
    func placeholder()
}

final class AuthService: AuthServiceProtocol {
    func placeholder() {}
}

//REMOVE
// MARK: - MockDataService Exemplo
protocol MockDataServiceProtocol {
    var message: String { get }
}

final class MockDataService: MockDataServiceProtocol {
    let message = "Dados mockados carregados"
}
