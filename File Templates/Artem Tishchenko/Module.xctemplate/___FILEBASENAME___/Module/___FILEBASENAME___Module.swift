//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//  ___COPYRIGHT___
//

import SwiftUI

/// Entry point of the ___VARIABLE_moduleName___ module, the value routers navigate to.
///
/// Nothing else has to be edited to make the screen reachable:
/// `navigation.push(.___VARIABLE_moduleName___)`.
///
/// Screen parameters go here as stored properties, they reach the assembly through
/// `build(container:)` and stay type checked all the way.
struct ___VARIABLE_moduleName___Module: Module {
    func build(container: Container) -> some View {
        container.resolve(___VARIABLE_moduleName___Assembly.self).build()
    }
}

/// Puts the module into code completion of every navigation call, the way enum cases
/// used to appear. With parameters it becomes a static function instead:
///
///     static func ___VARIABLE_moduleName___(itemID: String) -> Self { Self(itemID: itemID) }
extension Module where Self == ___VARIABLE_moduleName___Module {
    static var ___VARIABLE_moduleName___: Self { Self() }
}
