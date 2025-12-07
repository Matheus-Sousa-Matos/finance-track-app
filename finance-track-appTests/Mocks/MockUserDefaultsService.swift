//
//  MockUserDefaultsService.swift
//  finance-track-app
//
//  Created by Matheus de Sousa Matos on 03/12/25.
//

@testable import finance_track_app

final class MockUserDefaultsService: UserDefaultsServiceProtocol {
    private(set) var markOnboardingAsSeenCalled = false
    var isFirstLaunch: Bool = true
    
    func markOnboardingAsSeen() {
        markOnboardingAsSeenCalled = true
        isFirstLaunch = false
    }
}
