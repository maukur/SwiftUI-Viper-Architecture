//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//  ___COPYRIGHT___
//

import Foundation

/// Assemblies build views and view-related objects, so they are isolated to the main actor.
@MainActor
protocol AssemblyType: AnyObject {
    associatedtype Container
    var container: Container { get set }
    init(container: Container)
}

@MainActor
class Assembly: AssemblyType {
    var container: Container

    required init(container: Container) {
        self.container = container
    }
}

// Box
extension Assembly {
    func weakBox<T>(_ configure: () -> T) -> T {
        return container.weakBox(configure)
    }

    func strongBox<T>(_ configure: () -> T) -> T {
        return container.strongBox(configure)
    }
}
