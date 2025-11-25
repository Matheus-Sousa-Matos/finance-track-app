//
//  ButtonBuilder.swift
//  finance-track-app
//
//  Created by Matheus de Sousa Matos on 25/11/25.
//

import UIKit

class ButtonBuilder {
    private var title: String?
    private var titleColor: UIColor = .white
    private var backgroundColor: UIColor = .systemBlue
    private var cornerRadius: CGFloat = 8.0
    private var font: UIFont = .systemFont(ofSize: 16, weight: .semibold)
    private var target: Any?
    private var action: Selector?

    func setTitle(_ text: String) -> ButtonBuilder {
        self.title = text
        return self
    }
    
    func setTitleColor(_ text: String) -> ButtonBuilder {
        self.title = text
        return self
    }
    
    func setTitleColor(_ color: UIColor) -> ButtonBuilder {
        self.titleColor = color
        return self
    }
    
    func setBackgroundColor(_ color: UIColor) -> ButtonBuilder {
        self.backgroundColor = color
        return self
    }
    
    func setCornerRadius(_ radius: CGFloat) -> ButtonBuilder {
        self.cornerRadius = radius
        return self
    }
    
    func setFont(_ font: UIFont) -> ButtonBuilder {
        self.font = font 
        return self
    }
    
    func setAction(target: Any, action: Selector) -> ButtonBuilder {
        self.target = target
        self.action = action
        return self
    }
    
    func build() -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.backgroundColor = backgroundColor
        button.titleLabel?.font = font
        button.layer.cornerRadius = cornerRadius
        
        if let target = target, let action = action {
            button.addTarget(target, action: action, for: .touchUpInside)
        }
        
        return button
    }
    
}
