//
//  ConfigurableView.swift
//  finance-track-app
//
//  Created by Matheus de Sousa Matos on 02/12/25.
//

import UIKit

protocol ConfigurableView {
    func addSubViews()
    func configureStyles()
    func configureLayout()
}

extension ConfigurableView where Self: UIView {
    func setupView() {
        addSubViews()
        configureStyles()
        configureLayout()
    }
}
