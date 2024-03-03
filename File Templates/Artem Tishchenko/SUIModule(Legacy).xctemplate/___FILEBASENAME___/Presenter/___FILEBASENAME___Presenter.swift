//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//  ___COPYRIGHT___
//

import Foundation


final class ___VARIABLE_moduleName___Presenter: BasePresenter<___VARIABLE_moduleName___InteractorInput, ___VARIABLE_moduleName___RouterProtocol>, ___VARIABLE_moduleName___ModuleOutput, ___VARIABLE_moduleName___ModuleInput {
    
    // MARK: - Weak properties
    weak var view: ___VARIABLE_moduleName___ViewInput?

    func loadData() {
        Task {
            await interactor.loadData()
        }
    }
}
