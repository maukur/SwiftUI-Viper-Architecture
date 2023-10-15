//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//  ___COPYRIGHT___
//

import SwiftUI


// Router
protocol ___VARIABLE_moduleName___RouterProtocol: RouterProtocol {

}

// Presenter
protocol ___VARIABLE_moduleName___PresenterProtocol: PresenterProtocol {

}

// Interactor
protocol ___VARIABLE_moduleName___InteractorProtocol: InteractorProtocol {

}

// ViewState
protocol ___VARIABLE_moduleName___ViewStateProtocol: ViewStateProtocol {
    func set(with presenter: ___VARIABLE_moduleName___PresenterProtocol)
}
