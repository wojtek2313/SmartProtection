//
//  Router.swift
//  SmartProtection
//
//  Created by Wojciech Kulas on 13/10/2024.
//

import Combine
import SmartProtectionUI
import SwiftUI

public class Router: ObservableObject {
    // MARK: - Private Properties
    
    private var dependencyFactory: DependenciesFacotry
    @Binding private var isPresented: Bool
    
    // MARK: - Public Properties
    
    @Published var path: NavigationPath
    
    // MARK: - Initializers
    
    init(
        dependencyFactory: DependenciesFacotry,
        isPresented: Binding<Bool>,
        path: NavigationPath = NavigationPath()
    ) {
        self.dependencyFactory = dependencyFactory
        self._isPresented = isPresented
        self.path = path
    }
    
    // MARK: - Public Methods
    
    @ViewBuilder func view(for route: Route) -> some View {
        switch route {
        case .sosFirstAidForm:
            SOSFirstAidForm(dependencyFactory: dependencyFactory)
        case .sosIntroductionForm:
            SOSIntroductionForm(isPresented: $isPresented)
        case .sosPropertyForm:
            SOSPropertyForm()
        }
    }
    
    public func navigateTo(_ appRoute: Route) {
        path.append(appRoute)
    }
    
    public func navigateBack() {
        path.removeLast()
    }
    
    public func popToRoot() {
        path.removeLast(path.count)
    }
}
