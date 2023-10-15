//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//  ___COPYRIGHT___
//


import SwiftUI

final class ___VARIABLE_moduleName___Assembly: Assembly {
    
    func build() -> some View {
        
        let navigation = container.resolve(NavigationAssembly.self).build()

        // Router
        let router = ___VARIABLE_moduleName___Router(navigation: navigation)

        // Interactor
        let interactor = ___VARIABLE_moduleName___Interactor()

        //ViewState
        let viewState =  ___VARIABLE_moduleName___ViewState()

        // Presenter
        let presenter = ___VARIABLE_moduleName___Presenter(router: router, interactor: interactor, viewState: viewState)
        
        viewState.set(with: presenter)
        
        // View
        let view = ___VARIABLE_moduleName___View(viewState: viewState)
        return view
    }
}
