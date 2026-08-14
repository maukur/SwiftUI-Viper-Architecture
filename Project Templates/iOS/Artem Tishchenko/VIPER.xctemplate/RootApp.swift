//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//  ___COPYRIGHT___
//

import SwiftUI

@main
struct RootApp: App {
    @ObservedObject var appViewBuilder: ApplicationViewBuilder
    @ObservedObject var navigationService: NavigationService

    let container: DependencyContainer = {
        let factory = AssemblyFactory()
        let container = DependencyContainer(assemblyFactory: factory)

        // Assemblies resolve to themselves, so registration is only needed to
        // substitute an implementation, for tests or previews:
        // container.apply(MockNavigationAssembly.self)

        return container
    }()

    init() {
        navigationService = NavigationAssembly.navigation

        appViewBuilder = ApplicationViewBuilder(container: container)
    }

    var body: some Scene {
        WindowGroup {
            RootView(navigationService: navigationService,
                     appViewBuilder: appViewBuilder)
        }
    }
}
