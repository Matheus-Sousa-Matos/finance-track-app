//
//  AuthViewController.swift
//  finance-track-app
//
//  Created by Matheus de Sousa Matos on 26/11/25.
//

import UIKit

final class AuthViewController: BaseViewController {
    private let viewModel: AuthViewModel
    private let onComplete: (Bool) -> Void

    init(viewModel: AuthViewModel, onComplete: @escaping (Bool) -> Void) {
        self.viewModel = viewModel
        self.onComplete = onComplete
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) not implemented") }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTitle(title: "Autenticação")
        setupUI()
    }

    private func setupUI() {
        let button = UIButton(type: .system)
        button.setTitle("Entrar com Apple (mock)", for: .normal)
        button.addTarget(self, action: #selector(authTapped), for: .touchUpInside)

        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    @objc private func authTapped() {
        viewModel.authenticate { [weak self] success in
            print("Auth tapped in vc")
            self?.onComplete(success)
        }
    }
}
