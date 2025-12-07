//
//  UIView+Extensions.swift
//  finance-track-app
//
//  Created by Matheus de Sousa Matos on 06/12/25.
//

import UIKit

extension UIView {
    func applyAccessibility(
        label: String?,
        hint: String? = nil,
        traits: UIAccessibilityTraits = .none
    ) {
        isAccessibilityElement = true
        accessibilityLabel = label
        accessibilityHint = hint
        accessibilityTraits = traits
    }
}
