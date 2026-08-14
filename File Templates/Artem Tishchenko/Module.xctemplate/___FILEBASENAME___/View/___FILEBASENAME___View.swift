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
    }
}

// Once the module is registered in `Views` and `ApplicationViewBuilder`,
// the preview can be switched to `ApplicationViewBuilder.stub.build(view:)`.
#Preview {
    ___VARIABLE_moduleName___Assembly(container: RootApp().container).build()
}
