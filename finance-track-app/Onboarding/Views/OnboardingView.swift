//
//  OnboardingView.swift
//  finance-track-app
//
//  Created by Matheus de Sousa Matos on 26/11/25.
//

import UIKit

class OnboardingView: UIView, ConfigurableView {
    private let progressStackView = UIStackView()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let illustrationImageView = UIImageView()
    let nextButton = DS.Components.primaryButton(title: "NEXT")
    
    private enum Constants {
        static let totalInitialDots: Int = 3
        static let sizeImage: CGFloat = 200
        static let sizeDot: CGFloat = 10
        static let spacing: CGFloat = 200
    }

    private var progressDots: [UIView] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
        self.setupProgressDots(count: Constants.totalInitialDots)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func addSubViews() {
        addSubview(illustrationImageView)
        addSubview(progressStackView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(nextButton)
    }
    
    internal func configureStyles() {
        self.backgroundColor = DS.Colors.background
        
        illustrationImageView.contentMode = .scaleAspectFit

        progressStackView.axis = .horizontal
        progressStackView.distribution = .equalSpacing
        progressStackView.alignment = .center
        progressStackView.spacing = DS.Spacing.small
        
        titleLabel.textAlignment = .center
        titleLabel.font = DS.Typography.xlarge
        
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = DS.Typography.medium
    }
    
    internal func configureLayout() {
        [illustrationImageView, titleLabel, descriptionLabel, progressStackView, nextButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            illustrationImageView.topAnchor.constraint(equalTo: topAnchor, constant: Constants.spacing),
            illustrationImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            illustrationImageView.heightAnchor.constraint(equalToConstant: Constants.sizeImage),
            illustrationImageView.widthAnchor.constraint(equalToConstant: Constants.sizeImage),
            
            progressStackView.topAnchor.constraint(equalTo: illustrationImageView.bottomAnchor, constant: DS.Spacing.xlarge),
            progressStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            progressStackView.heightAnchor.constraint(equalToConstant: Constants.sizeDot),

            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: progressStackView.bottomAnchor, constant: DS.Spacing.xlarge),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: DS.Spacing.medium),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: DS.Spacing.large),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -DS.Spacing.large),
             
            nextButton.topAnchor.constraint(equalTo: bottomAnchor, constant: -Constants.spacing),
            nextButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    func configure(
        with page: OnboardingPage,
        currentIndex: Int,
        totalPages: Int
    ) {
        titleLabel.text = page.title
        descriptionLabel.text = page.description
        illustrationImageView.image = UIImage(named: page.backgroundImageName)
        nextButton.setTitle(page.buttonTitle.uppercased(), for: .normal)
        
        setupProgressDots(count: totalPages)
        updateProgressDots(currentIndex: currentIndex)
    }
    
    // MARK: - DOTs Progress
    private func setupProgressDots(count: Int) {
        progressDots.forEach { $0.removeFromSuperview() }
        progressDots = []

        for i in 0..<count {
            let dot = DS.Components.progressDot(isActive: i == 0)
            progressStackView.addArrangedSubview(dot)
            progressDots.append(dot)
        }
    }
    
    private func updateProgressDots(currentIndex: Int) {
        for (index, dot) in progressDots.enumerated() {
            dot.backgroundColor = index == currentIndex ? DS.Colors.primary : DS.Colors.tertiary
        }
    }
    
}
