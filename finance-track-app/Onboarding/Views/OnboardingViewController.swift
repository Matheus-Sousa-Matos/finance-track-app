//
//  OnboardingViewController.swift
//  finance-track-app
//
//  Created by Matheus de Sousa Matos on 25/11/25.
//

import UIKit

// MARK: - Placeholder ViewController
final class OnboardingViewController: BaseViewController {
    private let viewModel: OnboardingViewModel
    private let onboardingView: OnboardingView = OnboardingView()
    private let completion: () -> Void

    init(viewModel: OnboardingViewModel, completion: @escaping () -> Void) {
        self.viewModel = viewModel
        self.completion = completion
        super.init(nibName: nil, bundle: nil)
        
        self.viewModel.output = self
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) not implemented") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTitle(title: "Onboarding")
        bindData(viewModel.currentPage)
        onboardingView.proceedButton.addTarget(self, action: #selector(nextTapped), for: .touchUpInside)
    }
    
    override func loadView() {
        self.view = onboardingView
    }
    
    private func bindData(_ page: OnboardingPage) {
        onboardingView.configure(with: page)
    }

    @objc private func nextTapped() {
        viewModel.nextPage()
    }
}

extension OnboardingViewController: OnboardingViewModelOutput {
    func didUpdatePage(_ page: OnboardingPage) {
        bindData(page)
    }

    func didFinishOnboarding() {
        completion()
    }
}
