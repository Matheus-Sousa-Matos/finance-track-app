//
//  AuthViewModel.swift
//  finance-track-app
//
//  Created by Matheus de Sousa Matos on 26/11/25.
//


final class AuthViewModel {
    private let appleAuthService: AppleAuthServiceProtocol

    init(appleAuthService: AppleAuthServiceProtocol) {
        self.appleAuthService = appleAuthService
    }

    func authenticate(completion: @escaping (Bool) -> Void) {
        appleAuthService.signIn { success in completion(success) }
    }
}
