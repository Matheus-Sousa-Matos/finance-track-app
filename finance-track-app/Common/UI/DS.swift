//
//  DS.swift
//  finance-track-app
//
//  Created by Matheus de Sousa Matos on 02/12/25.
//

import UIKit

enum DS {
    
    // MARK: - Colors
    enum Colors {
        static let primary: UIColor = .primary
        static let secondary: UIColor = .secondary
        static let tertiary: UIColor = .tertiary
        static let background: UIColor = .background
        static let textPrimary: UIColor = .textPrimary
        static let textSecondary: UIColor = .textSecondary
    }
    
    // MARK: - Typography
    enum Typography {
        static let medium = UIFont.systemFont(ofSize: 16)
        static let large = UIFont.systemFont(ofSize: 20, weight: .medium)
        static let xlarge = UIFont.boldSystemFont(ofSize: 24)
    }
    
    // MARK: - Spacing
    enum Spacing {
        static let xsmall: CGFloat = 4
        static let small: CGFloat = 8
        static let medium: CGFloat = 16
        static let large: CGFloat = 24
        static let xlarge: CGFloat = 48
    }
    
    enum CornerRadius {
        static let small: CGFloat = 4
        static let medium: CGFloat = 8
        static let large: CGFloat = 16
    }
    
    // MARK: - Components
    enum Components {
        static func primaryButton(title: String) -> UIButton {
            var config = UIButton.Configuration.filled()
            config.title = title
            config.baseBackgroundColor = DS.Colors.primary
            config.baseForegroundColor = DS.Colors.secondary
            config.cornerStyle = .fixed
            config.contentInsets = NSDirectionalEdgeInsets(
                top: DS.Spacing.medium,
                leading: DS.Spacing.large,
                bottom: DS.Spacing.medium,
                trailing: DS.Spacing.large
            )
            
            let button = UIButton(configuration: config)
            button.layer.cornerRadius = DS.CornerRadius.large
            button.titleLabel?.textColor = DS.Colors.textPrimary
            button.clipsToBounds = true
            return button
        }
        
        static func progressDot(isActive: Bool) -> UIView {
            let dot = UIView()
            dot.layer.cornerRadius = DS.CornerRadius.small
            dot.translatesAutoresizingMaskIntoConstraints = false
            dot.widthAnchor.constraint(equalToConstant: 10).isActive = true
            dot.heightAnchor.constraint(equalToConstant: 10).isActive = true
            dot.backgroundColor = isActive ? DS.Colors.primary : DS.Colors.secondary
            return dot
        }
    }
}

