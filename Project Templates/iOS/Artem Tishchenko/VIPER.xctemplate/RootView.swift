//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//  ___COPYRIGHT___
//

import SwiftUI

struct RootView: View {
    @ObservedObject var navigationService: NavigationService
    @ObservedObject var appViewBuilder: ApplicationViewBuilder

    var body: some View {
        NavigationStack(path: $navigationService.items) {
            appViewBuilder.build(module: .Main)
                .navigationDestination(for: AnyModule.self) { module in
                    appViewBuilder.build(module: module)
                }
        }
        .fullScreenCover(item: $navigationService.popupView) { module in
            appViewBuilder.build(module: module)
                .presentationBackground(.clear)
        }
        .fullScreenCover(item: $navigationService.modalView) { module in
            appViewBuilder.build(module: module)
        }
        .alert(isPresented: .constant($navigationService.alert.wrappedValue != nil)) {
            switch navigationService.alert {
            case let .defaultAlert(yesAction, noAction):
                return Alert(title: Text("Title"),
                             primaryButton: .default(Text("Yes"), action: yesAction),
                             secondaryButton: .destructive(Text("No"), action: noAction))
            case .none:
                fatalError()
            }
        }
    }
}
