//
//  HomeViewModel.swift
//  finance-track-app
//
//  Created by Matheus de Sousa Matos on 25/11/25.
//

// MARK: - HomeViewModel
final class HomeViewModel: BaseViewModel {
    private let mockService: MockDataServiceProtocol

    init(mockService: MockDataServiceProtocol) {
        self.mockService = mockService
    }

    var exposedMessage: String {
        mockService.message
    }
}
