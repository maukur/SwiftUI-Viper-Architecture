//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//  ___COPYRIGHT___
//

import Foundation

typealias Container = Resolver
typealias LightContainer = Applyer & Resolver

// Container
protocol Applyer {
    func apply<T: Assembly>(_ type: T.Type, name: String?)
    func apply<T: Assembly>(_ type: T.Type)
}

extension Applyer {
    func apply<T: Assembly>(_ type: T.Type) {
        apply(type, name: nil)
    }
}

// Resolver
protocol Resolver: WeakBox, StrongBox {
    @MainActor func resolve<T: Assembly>(_ type: T.Type, name: String?) -> T
    @MainActor func resolve<T: Assembly>(_ type: T.Type) -> T
}

extension Resolver {
    @MainActor
    func resolve<T>(_ type: T.Type) -> T where T: Assembly {
        return resolve(type, name: nil)
    }
}

// DI Container
class DependencyContainer {
    var weakBoxHolder = [String: WeakContainer]()
    var strongBoxHolder = [String: AnyObject]()

    let assemblyFactory: AssemblyFactoryProtocol

    init(assemblyFactory: AssemblyFactoryProtocol) {
        self.assemblyFactory = assemblyFactory
    }
}

extension DependencyContainer: Resolver {
    @MainActor
    func resolve<T>(_ type: T.Type, name: String?) -> T where T: Assembly {
        let module = assemblyFactory.resolve(type, name: name)
        return module.init(container: self)
    }
}

extension DependencyContainer: Applyer {
    func apply<T>(_ type: T.Type, name: String?) where T: AssemblyType {
        assemblyFactory.apply(type, name: name)
    }
}
