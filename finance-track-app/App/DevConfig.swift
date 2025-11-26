//
//  DevConfig.swift
//  finance-track-app
//
//  Created by Matheus de Sousa Matos on 26/11/25.
//

enum FlowBypasss {
    case none
    case forceOnboarding
    case forceAuth
}

struct DevConfig {
    static var flowBypass: FlowBypasss = .none
}
