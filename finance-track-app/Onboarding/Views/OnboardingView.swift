//
//  OnboardingView.swift
//  finance-track-app
//
//  Created by Matheus de Sousa Matos on 26/11/25.
//

import UIKit

class OnboardingView: UIView {
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
    let backgroundImageView = UIImageView()
    let proceedButton = UIButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setup() {
        self.addSubViews()
        
        //Configuration elements
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 3
        descriptionLabel.font = UIFont.systemFont(ofSize: 16)
        
        proceedButton.setTitle("Continuar", for: .normal)
        
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        proceedButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        //Constraints
        NSLayoutConstraint.activate([
            
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),

            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -60),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
             
            proceedButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 24),
            proceedButton.centerXAnchor.constraint(equalTo: centerXAnchor)
            
        ])
    }
    
    private func addSubViews() {
        addSubview(backgroundImageView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(proceedButton)
    }
    
    func configure(with page: OnboardingPage) {
        titleLabel.text = page.title
        descriptionLabel.text = page.description
        backgroundImageView.image = UIImage(named: page.backgroundImageName)
        proceedButton.setTitle(page.buttonTitle, for: .normal)
    }
}
