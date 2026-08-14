//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//  ___COPYRIGHT___
//

import SwiftUI

/// Type-erased `Module`.
///
/// The navigation stack, the modal slot and the popup slot hold modules of different
/// screens side by side, which a heterogeneous collection cannot do without erasure.
/// Identity and equality are delegated to the wrapped module, so two `AnyModule` values
/// are equal exactly when the modules inside them are.
struct AnyModule: Identifiable, Hashable {
    let id: AnyHashable
    private let content: @MainActor (Container) -> AnyView

    init<M: Module>(_ module: M) {
        id = AnyHashable(module)
        content = { container in AnyView(module.build(container: container)) }
    }

    /// Builds the wrapped module.
    @MainActor
    func build(container: Container) -> AnyView {
        content(container)
    }

    /// Returns the wrapped module back in its original type, `nil` on a mismatch.
    func unwrap<M: Module>(as _: M.Type) -> M? {
        id.base as? M
    }

    static func == (lhs: AnyModule, rhs: AnyModule) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
