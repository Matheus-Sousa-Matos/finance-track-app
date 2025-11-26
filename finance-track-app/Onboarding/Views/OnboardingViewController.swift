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
    private let completion: () -> Void

    init(viewModel: OnboardingViewModel, completion: @escaping () -> Void) {
        self.viewModel = viewModel
        self.completion = completion
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) not implemented") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTitle(title: "Onboarding")
        setupUI()
    }

    private func setupUI() {
        let label = UILabel()
        label.text = "Bem-vindo ao Finance App\n"
        label.numberOfLines = 0
        label.textAlignment = .center

        let button = UIButton(type: .system)
        button.setTitle("Finalizar Onboarding", for: .normal)
        button.addTarget(self, action: #selector(nextTapped), for: .touchUpInside)

        view.addSubview(label)
        view.addSubview(button)
        label.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),

            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    @objc private func nextTapped() {
        viewModel.completeOnboarding()
        completion()
    }
    
}
