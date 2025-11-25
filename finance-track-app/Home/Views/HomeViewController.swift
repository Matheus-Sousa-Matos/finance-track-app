//
//  HomeViewController.swift
//  finance-track-app
//
//  Created by Matheus de Sousa Matos on 25/11/25.
//

import UIKit

final class HomeViewController: BaseViewController {
    let viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.setupTitle(title: "Home")
        
        print("[Home] mensagem: \(viewModel.exposedMessage)")
        
        let buttonNext = ButtonBuilder()
            .setTitle("Continuar")
            .setTitleColor(.white)
            .setBackgroundColor(.systemGreen)
            .setAction(target: self, action: #selector(buttonTapped))
            .build()
        
        /// O frame deve ser feito fora do builder, visto que o build cuida apenas de estilo e comportamento.
        buttonNext.frame = CGRect(x: 100, y: 200, width: 200, height: 50)
        view.addSubview(buttonNext)
    }
    
    @objc func buttonTapped(){
        print("Button tapped")
    }
    
}
