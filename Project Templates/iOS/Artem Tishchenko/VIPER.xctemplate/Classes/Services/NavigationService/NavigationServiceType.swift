//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//  ___COPYRIGHT___
//

import Combine
import Foundation

/// The `NavigationServiceType` protocol defines a navigation service in the application,
/// providing management of the view stack, modal windows, popups, and alerts.
/// The service drives SwiftUI state, so it is isolated to the main actor.
///
/// Destinations are `Module` values declared by the modules themselves, stored here
/// type-erased as `AnyModule`.
@MainActor
protocol NavigationServiceType: ObservableObject, Identifiable {
    /// An array of views that make up the current navigation stack.
    /// Used for managing transitions between screens.
    /// By default, this array is empty, and the root page is bound to the NavigationStack body in the RootView body.
    var items: [AnyModule] { get set }

    /// The current modal view, if active.
    /// Can be `nil` if there is no active modal window.
    var modalView: AnyModule? { get set }

    /// The current popup view, if active.
    /// Can be `nil` if no popup is displayed.
    var popupView: AnyModule? { get set }

    /// The current alert (dialog window), if active.
    /// Can be `nil` if there are no active alerts.
    var alert: CustomAlert? { get set }
}

// Routers call these instead of erasing modules by hand.
extension NavigationServiceType {
    /// Pushes a screen onto the navigation stack.
    func push(_ module: some Module) {
        items.append(module.erased)
    }

    /// Pops the topmost screen off the navigation stack.
    func pop() {
        guard !items.isEmpty else { return }
        items.removeLast()
    }

    /// Pops every screen off the navigation stack, back to the root one.
    func popToRoot() {
        items.removeAll()
    }

    /// Presents a screen modally, full screen.
    func present(modal module: some Module) {
        modalView = module.erased
    }

    /// Presents a screen as a popup over a transparent background.
    func present(popup module: some Module) {
        popupView = module.erased
    }

    /// Dismisses the modal screen, if any.
    func dismissModal() {
        modalView = nil
    }

    /// Dismisses the popup, if any.
    func dismissPopup() {
        popupView = nil
    }
}
