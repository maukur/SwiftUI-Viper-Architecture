//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//  ___COPYRIGHT___
//

import SwiftUI

/// An entry point of a screen module, and a navigation destination.
///
/// Every module declares its own entry point next to its assembly and says how it is
/// built, so adding a module never requires editing shared files. The compiler enforces
/// the contract: a module without `build(container:)` simply does not conform.
///
/// Screen parameters travel as stored properties, which keeps them type safe:
///
///     struct DetailsModule: Module {
///         let itemID: String
///
///         func build(container: Container) -> some View {
///             container.resolve(DetailsAssembly.self).build(itemID: itemID)
///         }
///     }
protocol Module: Hashable {
    associatedtype Content: View

    /// Builds the screen this module stands for.
    @MainActor @ViewBuilder func build(container: Container) -> Content
}

extension Module {
    /// Wraps the module so it can be stored next to modules of other screens.
    var erased: AnyModule { AnyModule(self) }
}
