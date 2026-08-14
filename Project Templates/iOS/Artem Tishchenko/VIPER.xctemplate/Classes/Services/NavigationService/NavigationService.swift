//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//  ___COPYRIGHT___
//

import Combine
import SwiftUI

final class NavigationService: NavigationServiceType {
    // `Identifiable` requirement stays outside the main actor isolation
    nonisolated let id = UUID()

    @Published var modalView: AnyModule?
    @Published var popupView: AnyModule?
    @Published var items: [AnyModule] = []
    @Published var alert: CustomAlert?
}

enum CustomAlert: Equatable, Hashable {
    static func == (lhs: CustomAlert, rhs: CustomAlert) -> Bool {
        lhs.hashValue == rhs.hashValue
    }

    func hash(into hasher: inout Hasher) {
        switch self {
        case .defaultAlert:
            hasher.combine("defaultAlert")
        }
    }

    case defaultAlert(yesAction: (() -> Void)?, noAction: (() -> Void)?)
}
