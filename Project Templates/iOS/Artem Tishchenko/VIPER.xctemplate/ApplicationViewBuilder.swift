//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//  ___COPYRIGHT___
//

import Combine
import SwiftUI

/// Builds screens out of modules against the application container.
///
/// There is no per-module switch here: a `Module` knows how to build itself, so a new
/// module needs no changes in this file.
final class ApplicationViewBuilder: Assembly, ObservableObject {
    required init(container: Container) {
        super.init(container: container)
    }

    @ViewBuilder
    func build(module: some Module) -> some View {
        module.build(container: container)
    }

    @ViewBuilder
    func build(module: AnyModule) -> some View {
        module.build(container: container)
    }
}

extension ApplicationViewBuilder {
    static var stub: ApplicationViewBuilder {
        return ApplicationViewBuilder(
            container: RootApp().container
        )
    }
}
