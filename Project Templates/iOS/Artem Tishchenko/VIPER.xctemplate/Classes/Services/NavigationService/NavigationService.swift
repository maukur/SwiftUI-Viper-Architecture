//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//  ___COPYRIGHT___
//


import SwiftUI

public class NavigationService: NavigationServiceType  {
    
    public let id = UUID()
    
    public static func == (lhs: NavigationService, rhs: NavigationService) -> Bool {
        lhs.id == rhs.id
    }
    
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
        hasher.combine(self.stringKey)
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
    
    case defaultAlert(yesAction: (()->Void)?, noAction: (()->Void)?)
}
