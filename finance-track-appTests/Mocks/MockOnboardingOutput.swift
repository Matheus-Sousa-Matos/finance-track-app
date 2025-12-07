//
//  MockOnboardingOutput.swift
//  finance-track-app
//
//  Created by Matheus de Sousa Matos on 03/12/25.
//

@testable import finance_track_app

final class MockOnboardingOutput: OnboardingViewModelOutput {
    private(set) var didUpdatePageCalled = false
    private(set) var didFinishOnboardingCalled = false
    
    func didUpdatePage(_ page: OnboardingPage) {
        didUpdatePageCalled = true
    }
    
    func didFinishOnboarding() {
        didFinishOnboardingCalled = true
    }
}
