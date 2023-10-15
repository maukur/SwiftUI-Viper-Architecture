//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//  ___COPYRIGHT___
//

import SwiftUI

final class ___VARIABLE_moduleName___Presenter: ___VARIABLE_moduleName___PresenterProtocol {
    
    private let router: ___VARIABLE_moduleName___RouterProtocol
    private let viewState: ___VARIABLE_moduleName___ViewStateProtocol
    private let interactor: ___VARIABLE_moduleName___InteractorProtocol
    
    init(router: ___VARIABLE_moduleName___RouterProtocol,
         interactor: ___VARIABLE_moduleName___InteractorProtocol,
         viewState: ___VARIABLE_moduleName___ViewStateProtocol) {
        self.router = router
        self.interactor = interactor
        self.viewState = viewState
    }
    
    
}
