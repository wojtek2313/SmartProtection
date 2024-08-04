//
//  DependencyFactory.swift
//  SmartProtectionDependencyFactory
//
//  Created by Wojciech Kulas on 02/08/2024.
//

import Foundation

public protocol DependencyFactoryProtocol {
    
}

public class DependencyFactory<Dependency, DependencyType>: DependencyFactoryProtocol
where Dependency: Any, DependencyType: Hashable {
    
    private var dependencyStore: [DependencyType: Dependency] = [:]
    
    public let shared = DependencyFactory()
    
    private init() {}
    
    public func generate(ofType type: DependencyType) -> Dependency {
        guard let dependency = dependencyStore[type] else {
            fatalError("Dependency of type: \(type) not registered")
        }
        return dependency
    }
    
    public func register(_ dependency: Dependency, with type: DependencyType) {
        dependencyStore[type] = dependency
    }
}
