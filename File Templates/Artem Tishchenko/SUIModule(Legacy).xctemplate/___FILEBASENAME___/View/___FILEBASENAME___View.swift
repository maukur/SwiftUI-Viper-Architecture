//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//  ___COPYRIGHT___
//

import SwiftUI

struct ___VARIABLE_moduleName___View: View {
           
    @StateObject var viewState: ___VARIABLE_moduleName___ViewState
    
    var body: some View {
        Text("Hello iOS")
            .onAppear {
                viewState.onAppear()
            }
    }
}

struct ___VARIABLE_moduleName___Previews: PreviewProvider {
    static var previews: some View {
        ___VARIABLE_moduleName___View(viewState:  ___VARIABLE_moduleName___ViewState())
    }
}
