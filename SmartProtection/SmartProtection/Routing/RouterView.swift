//
//  RouterView.swift
//  SmartProtection
//
//  Created by Wojciech Kulas on 13/10/2024.
//

import SwiftUI

struct RouterView<Content: View>: View {
    // MARK: - Private Properties
    
    @StateObject private var router: Router
    private let content: Content
    
    // MARK: - Initializers
    
    init(router: Router, @ViewBuilder content: @escaping () -> Content) {
        self._router = StateObject(wrappedValue: router)
        self.content = content()
    }
    
    // MARK: - UI
    
    var body: some View {
        NavigationStack(path: $router.path) {
            content.navigationDestination(for: Route.self) { route in
                router.view(for: route)
            }
            .environmentObject(router)
        }
    }
}
