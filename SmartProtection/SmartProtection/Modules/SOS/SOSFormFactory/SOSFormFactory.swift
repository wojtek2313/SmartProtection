//
//  SOSFormFactory.swift
//  SmartProtection
//
//  Created by Wojciech Kulas on 15/10/2024.
//

import SwiftUI

protocol SOSFormFactoryProtocol {
    func createSOSForm(isPresented: Binding<Bool>, dependencyFactory: DependenciesFacotry) -> SOSForm
}

class SOSFormFactory: SOSFormFactoryProtocol {
    func createSOSForm(isPresented: Binding<Bool>, dependencyFactory: DependenciesFacotry) -> SOSForm {
        let router = Router(dependencyFactory: dependencyFactory, isPresented: isPresented)
        return SOSForm(router: router, isPresented: isPresented)
    }
}
