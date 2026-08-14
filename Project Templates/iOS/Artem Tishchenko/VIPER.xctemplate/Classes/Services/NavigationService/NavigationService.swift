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

    @Published var modalView: Views?
    @Published var popupView: Views?
    @Published var items: [Views] = []
    @Published var alert: CustomAlert?
}

enum Views: Identifiable, Equatable, Hashable {
    var id: String { stringKey }

    static func == (lhs: Views, rhs: Views) -> Bool {
        lhs.stringKey == rhs.stringKey
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(stringKey)
    }

    case main

    var stringKey: String {
        switch self {
        case .main:
            return "main"
        }
    }
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
