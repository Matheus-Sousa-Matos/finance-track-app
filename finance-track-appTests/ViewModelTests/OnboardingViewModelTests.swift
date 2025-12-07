//
//  OnboardingViewModelTests.swift
//  finance-track-app
//
//  Created by Matheus de Sousa Matos on 03/12/25.
//

import XCTest
@testable import finance_track_app

final class OnboardingViewModelTests: XCTestCase {
    private var mockUserDefaults: MockUserDefaultsService!
    private var mockOutput: MockOnboardingOutput!
    private var sut: OnboardingViewModel! // System Under Test
    
    override func setUp() {
        super.setUp()
        mockUserDefaults = MockUserDefaultsService()
        mockOutput = MockOnboardingOutput()
        
        let pages = [
            OnboardingPage(title: "Page 1", description: "Desc 1", backgroundImageName: "Wallet", buttonTitle: "Next"),
            OnboardingPage(title: "Page 2", description: "Desc 2", backgroundImageName: "Budget", buttonTitle: "Next")
        ]
        
        sut = OnboardingViewModel(userDefaults: mockUserDefaults, pages: pages)
        sut.output = mockOutput
    }
    
    func test_nextPage_updatesIndexAndCallsOutput() {
        sut.nextPage()
        
        XCTAssertEqual(sut.currentIndex, 1)
        XCTAssertTrue(mockOutput.didUpdatePageCalled)
    }
    
    func test_nextPage_onLastPage_callsCompleteOnboardingFlow() {
        sut.currentIndex = sut.pages.count - 1
        
        sut.nextPage()
        
        XCTAssertTrue(mockUserDefaults.markOnboardingAsSeenCalled)
        XCTAssertTrue(mockOutput.didFinishOnboardingCalled)
    }
}

