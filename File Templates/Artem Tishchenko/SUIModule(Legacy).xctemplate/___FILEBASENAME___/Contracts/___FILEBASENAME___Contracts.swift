//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//  ___COPYRIGHT___
//

import Foundation

// Router
protocol ___VARIABLE_moduleName___RouterProtocol: BaseModuleRouter {

}

//Interacror
protocol ___VARIABLE_moduleName___InteractorInput {
    func loadData() async
}

// ViewState
protocol ___VARIABLE_moduleName___ViewInput: AnyObject {
    func set(with presener: ___VARIABLE_moduleName___ModuleOutput)
}

protocol ___VARIABLE_moduleName___ModuleInput {
    
}

// Presenter
protocol ___VARIABLE_moduleName___PresenterProtocol:  BasePresenter<___VARIABLE_moduleName___InteractorInput, ___VARIABLE_moduleName___RouterProtocol> {

}

//Presenter output
protocol ___VARIABLE_moduleName___ModuleOutput {
    func loadData()
}

