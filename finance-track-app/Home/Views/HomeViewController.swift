//
//  HomeViewController.swift
//  finance-track-app
//
//  Created by Matheus de Sousa Matos on 25/11/25.
//

import UIKit

final class HomeViewController: UIViewController {
    let viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Home"
    }
    
    @objc func buttonTapped(){
        print("Button tapped")
    }
    
}
