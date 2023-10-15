//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//  ___COPYRIGHT___
//

import SwiftUI

final class ___VARIABLE_moduleName___ViewState: ObservableObject, ___VARIABLE_moduleName___ViewStateProtocol {    
    private let id = UUID()
    private var presenter: ___VARIABLE_moduleName___PresenterProtocol?
    
    func set(with presener: ___VARIABLE_moduleName___PresenterProtocol) {
        self.presenter = presener
    }
}
