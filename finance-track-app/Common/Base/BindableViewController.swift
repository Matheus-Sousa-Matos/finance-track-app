//
//  BindableViewController.swift
//  finance-track-app
//
//  Created by Matheus de Sousa Matos on 02/12/25.
//

// Validar necessidade... 
protocol BindableViewController {
    associatedtype ViewModel
    var viewModel: ViewModel { get }
    func bindViewModel()
}
