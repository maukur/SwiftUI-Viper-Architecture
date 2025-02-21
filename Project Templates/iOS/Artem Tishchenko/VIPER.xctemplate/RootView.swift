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
            appViewBuilder.build(view: .main)
                .navigationDestination(for: Views.self) { path in
                    switch path {
                    default:
                        fatalError()
                    }
                }
        }
        .fullScreenCover(item: $navigationService.popupView) { item in
            appViewBuilder.build(view: item)
                .presentationBackground(.clear)
        }
        .fullScreenCover(item: $navigationService.modalView) { item in
            appViewBuilder.build(view: item)
        }
        .alert(isPresented: .constant($navigationService.alert.wrappedValue != nil)) {
            switch navigationService.alert {
            case .defaultAlert(let yesAction, let noAction):
                return Alert(title: Text("Title"),
                             primaryButton: .default(Text("Yes"), action: yesAction),
                             secondaryButton: .destructive(Text("No"), action: noAction))
            case .none:
                fatalError()
            }
        }
        
    }
}
