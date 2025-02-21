//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//  ___COPYRIGHT___
//

import Foundation

/// The `NavigationServiceType` protocol defines a navigation service in the application,
/// providing management of the view stack, modal windows, popups, and alerts.
protocol NavigationServiceType: ObservableObject, Identifiable {
    
    /// An array of views that make up the current navigation stack.
    /// Used for managing transitions between screens.
    /// By default, this array is empty, and the root page is bound to the NavigationStack body in the RootView body.
    var items: [Views] { get set }
    
    /// The current modal view, if active.
    /// Can be `nil` if there is no active modal window.
    var modalView: Views? { get set }
    
    /// The current popup view, if active.
    /// Can be `nil` if no popup is displayed.
    var popupView: Views? { get set }
    
    /// The current alert (dialog window), if active.
    /// Can be `nil` if there are no active alerts.
    var alert: CustomAlert? { get set }
}
