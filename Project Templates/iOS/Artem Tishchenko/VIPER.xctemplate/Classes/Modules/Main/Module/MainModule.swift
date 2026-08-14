//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//  ___COPYRIGHT___
//

import SwiftUI

/// Entry point of the Main module, the value routers navigate to.
///
/// Screen parameters go here as stored properties, they reach the assembly through
/// `build(container:)` and stay type checked all the way.
struct MainModule: Module {
    func build(container: Container) -> some View {
        container.resolve(MainAssembly.self).build()
    }
}

/// Puts the module into code completion of every navigation call, the way enum cases
/// used to appear. With parameters it becomes a static function instead:
///
///     static func Main(itemID: String) -> Self { Self(itemID: itemID) }
extension Module where Self == MainModule {
    static var Main: Self { Self() }
}
