//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//  ___COPYRIGHT___
//

import SwiftUI

struct MainView: View {
    @StateObject var viewState: MainViewState

    var body: some View {
        Text("Hello iOS")
    }
}

#Preview {
    ApplicationViewBuilder.stub.build(module: .Main)
}
