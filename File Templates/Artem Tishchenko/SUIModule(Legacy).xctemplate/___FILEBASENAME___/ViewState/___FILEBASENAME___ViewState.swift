//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//  ___COPYRIGHT___
//

import SwiftUI

final class ___VARIABLE_moduleName___ViewState: ObservableObject, ___VARIABLE_moduleName___ViewInput {
   
    private let id = UUID()
    private var presenter: ___VARIABLE_moduleName___ModuleOutput?
        
    func set(with presener: ___VARIABLE_moduleName___ModuleOutput) {
        self.presenter = presener
    }
    
    func onAppear() {
        presenter?.loadData()
    }
}
