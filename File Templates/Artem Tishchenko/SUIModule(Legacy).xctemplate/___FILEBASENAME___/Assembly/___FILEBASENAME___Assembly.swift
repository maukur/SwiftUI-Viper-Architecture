//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//  ___COPYRIGHT___
//

import SwiftUI
import UIKit

typealias ___VARIABLE_moduleName___Module = Module<___VARIABLE_moduleName___ModuleInput, ___VARIABLE_moduleName___ModuleOutput>


final class ___VARIABLE_moduleName___Assembly: Assembly {
    
    func build(coordinator: CoordinatorType) -> ___VARIABLE_moduleName___Module {

        // Router
        let router = ___VARIABLE_moduleName___Router(coordinator: coordinator)

        // Interactor
        let interactor = ___VARIABLE_moduleName___Interactor()

        //ViewState
        let viewState = ___VARIABLE_moduleName___ViewState()

        // Presenter
        let presenter = ___VARIABLE_moduleName___Presenter(interactor: interactor, router: router)
        
        viewState.set(with: presenter)
        presenter.view = viewState
        
        // View
        let view = UIHostingController(rootView: ___VARIABLE_moduleName___View(viewState: viewState))
        
        return Module(view: view, input: presenter, output: presenter)
    }
}
