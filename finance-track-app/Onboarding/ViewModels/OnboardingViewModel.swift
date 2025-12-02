//
//  OnboardingViewModel.swift
//  finance-track-app
//
//  Created by Matheus de Sousa Matos on 26/11/25.
//

// MARK: - Output do ViewModel
protocol OnboardingViewModelOutput: AnyObject {
    func didUpdatePage(_ page: OnboardingPage)
    func didFinishOnboarding()
}

final class OnboardingViewModel {
    let pages: [OnboardingPage]
    var currentIndex: Int = 0
    private let userDefaults: UserDefaultsServiceProtocol
    weak var output: OnboardingViewModelOutput?
    
    var currentPage: OnboardingPage {
        pages[currentIndex]
    }
    
    var canProceed: Bool {
        currentIndex < pages.count - 1
    }

    init(userDefaults: UserDefaultsServiceProtocol,
         pages: [OnboardingPage])
    {
        self.userDefaults = userDefaults
        self.pages = pages
    }

    func completeOnboarding() {
        userDefaults.markOnboardingAsSeen()
    }
    
    func completeOnboardingFlow() {
        userDefaults.markOnboardingAsSeen()
        output?.didFinishOnboarding()
    }
    
    func nextPage() {
        if canProceed {
            currentIndex += 1
            output?.didUpdatePage(currentPage)
        } else {
            completeOnboardingFlow()
        }
    }
    
}
