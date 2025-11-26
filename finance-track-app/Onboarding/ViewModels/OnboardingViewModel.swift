//
//  OnboardingViewModel.swift
//  finance-track-app
//
//  Created by Matheus de Sousa Matos on 26/11/25.
//

final class OnboardingViewModel: BaseViewModel {
    private let userDefaults: UserDefaultsServiceProtocol

    init(userDefaults: UserDefaultsServiceProtocol) {
        self.userDefaults = userDefaults
    }

    func completeOnboarding() {
        userDefaults.markOnboardingAsSeen()
    }
}
