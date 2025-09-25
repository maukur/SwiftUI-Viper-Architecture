## Overview

SwiftUI Viper Architecture - The development paradigm of clean, testable code and modular iOS applications.

This repository contains Xcode templates for quickly creating a project, modules, and services.

* [Viper](#viper)
  + [Introduction](#introduction)
  + [SwiftUI Viper Architecture](#swiftUI-viper-architecture)
* [Installation](#installation)
* [Requirements](#requirements)
* [Example project](#example-project)
* [Usage](#usage)
  + [Create a new Project](#create-a-new-project)
  + [Create a new Module](#create-a-new-module)
  + [Create a new Service](#create-a-new-service)
* [Navigation and Parameter Passing](#navigation-and-Parameter-Passing-in-SwiftUI-VIPER-Architecture)
* [Author](#author)
* [License](#license)
* [Special Thanks](#special-thanks)


## Viper

### Introduction

VIPER (View, Interactor, Presenter, Entity, Router) is an architectural pattern for building applications. In SwiftUI, this pattern isn't as commonly used as in UIKit, but it can still be employed for code organization with a little trickery, by introducing an entity like ViewState.

What is ViewState used for and what concept is it based on?

ViewState (View State) is similar to @IBOutlet properties and data stored in a viewController, but in the new concept, it utilizes @Published properties and views.

Let's clarify this with an analogy:

#### Storyboard and ViewController:
- Storyboard is a visual representation of the user interface where you place interface elements such as buttons, text fields, and others. It is responsible for organizing and positioning these elements.
- ViewController is an object that manages the interaction between data and the interface. It contains the logic that handles user input, updates the view, and works with data.
#### View and ViewState:
- View is the basic building block in the user interface. It's an abstraction that represents a part of the user interface, such as a button, text field, image, etc.
- ViewState is an abstraction representing the state of a view in Swift. It contains the data needed to display the current state of the interface. This could be, for example, the current text in a text field, the selected item in a table, etc.

### SwiftUI Viper Architecture:

#### View:
- Responsible for presenting data to the user and interacting with them.
- Handles user input and passes it to the presenter for processing.

#### ViewState:
- Controls the interaction between the Presenter and the View.
- Responsible for storing displayed data in the user interface.
- Receives user input from the view and translates it into commands for the presenter.

#### Interactor:
- Contains the business logic and rules for processing data.
- Handles requests to the data store (e.g., database, network) and processes them before presenting them.
- Does not contain code related to presentation or user interface.

#### Presenter:
- Responsible for processing data from the interactor and preparing it for display in the user interface.
- Controls the interaction between the interactor and the view.
- Receives user input from the view, processes it, and converts it into commands for the interactor.

#### Entity (Model):
- Represents data objects used in the application.
- Typically, they are simple data objects without methods, containing only properties.

#### Router:
- Handles navigation between screens in the application.
- Decides which screen should be shown in response to specific user actions.

## Installation

Only need execute this command in terminal:

```swift
swift install.swift
```

## Requirements

* Xcode 14+
* Swift 5.7+

## Example project

[Download](https://github.com/maukur/SwiftUI-Viper-Example/) example project built on the basis of this paradigm.


## Usage

### Create a new Project

```swift
Open Xcode
File > New > Project or press shortcuts ⇧⌘N
Select VIPER Architecture
Profit! 🎉
```
#### Project structure
 ```swift
┌── ApplicationViewBuilder.swift
├── RootApp.swift
├── RootView.swift
└── Classes
     ├── Modules
     │   └── Main
     │       ├── Assembly
     │       │   └── MainAssembly.swift
     │       ├── Contracts
     │       │   └── MainContracts.swift
     │       ├── Interactor
     │       │   └── MainInteractor.swift
     │       ├── Presenter
     │       │   └── MainPresenter.swift
     │       ├── Router
     │       │   └── MainRouter.swift
     │       ├── View
     │       │   └── MainView.swift
     │       └── ViewState
     │           └── MainViewState.swift
     ├── Services
     │   └── NavigationService
     │       ├── NavigationAssembly.swift
     │       ├── NavigationService.swift
     │       └── NavigationServiceType.swift
     ├── Architecture
     │   ├── InteractorProtocol.swift
     │   ├── PresenterProtocol.swift
     │   ├── RouterProtocol.swift
     │   └── ViewStateProtocol.swift   
     └── Library
         └── Swilby
             ├── Assembly.swift
             ├── AssemblyFactory.swift
             ├── DependencyContainer.swift
             ├── ObjectKey.swift
             ├── StrongBox.swift
             ├── WeakBox.swift
             └── WeakContainer.swift
```

### Create a new Module
<img src="https://github.com/bartleby/Core-iOS-Application-Architecture/blob/master/images/module-viper.png" align="left" height="80px" hspace="0px" vspace="10px">

<br>
<br>
<br>
<br>

```swift
Open Xcode Project
Select Modules in Xcode Project Navigator
Create new file
File > New > File... or press shortcuts ⌘N
Select Module or Service
Enter Name
After you have created a Module you need to remove the reference on the folder
Highlight the Folder in the Xcode Project Navigator
Press Backspace Key
Press "Remove Reference" in the alert window
Now you need to return your Folder to the project.
Drag the Folder from the Finder to the Xcode project
Profit! 🎉
```

#### Module structure
You can use different modules in one project based on the complexity of your screen.
One screen - one module.

All your modules should be in the "Modules" folder along the path "Classes/Assemblys/Modules"

 ```swift
┌── Assembly
├── Contracts
├── Interactor
├── Presenter
├── Router
├── View
└── ViewState
```
#### Setup Modules
Important! You need to add your Service, Module to the DI Container in the RootApp.swift

```swift
container.apply(MainAssembly.self)
// add your module here
```

### Create a new Service
<img src="https://github.com/bartleby/Core-iOS-Application-Architecture/blob/master/images/service.png" align="left" height="80px" hspace="0px" vspace="10px">

<br>
<br>
<br>
<br>

```swift
Open Xcode Project
Select Services in Xcode Project Navigator
Create new file
File > New > File... or press shortcuts ⌘N
Select Module or Service
Enter Name (if you want to create "Service" you must specify at the end of the name "Service" for example - NetworkService or SettingsService)
After you have created a Service you need to remove the reference on the folder
Highlight the Folder in the Xcode Project Navigator
Press Backspace Key
Press "Remove Reference" in the alert window
Now you need to return your Folder to the project.
Drag the Folder from the Finder to the Xcode project
Profit! 🎉
```
#### Service structure
Each service is engaged in its own business: the authorization service works with authorization, the user service with user data and so on. A good rule (a specific service works with one type of entity) is separation from the server side into different path: /auth, /user, /settings, but this is not necessary.

All your services should be in the "Services" folder along the path "Classes/Assemblys/Services"

You can learn more about the principle of developing SoA from [wikipedia](https://en.wikipedia.org/wiki/Service-oriented_architecture)

 ```swift
┌── ServiceAssembly
├── ServiceProtocol
└── ServiceImplementation
```
#### Setup Services
Important! You need to add your Service, Module to the DI Container in the RootApp.swift

```swift
container.apply(NavigationServiceAssembly.self)
// add your service here
```

# Navigation and Parameter Passing in SwiftUI VIPER Architecture

This document provides examples of how to implement navigation between modules and pass parameters in SwiftUI VIPER architecture based on real application patterns.

## Table of Contents
- [Navigation Overview](#navigation-overview)
- [Module Enum Definition](#module-enum-definition)
- [Router Implementation](#router-implementation)
- [ApplicationViewBuilder for Module Creation](#applicationviewbuilder-for-module-creation)
- [Assembly with Parameters](#assembly-with-parameters)
- [RootView Setup](#rootview-setup)
- [Navigation Types](#navigation-types)
- [Parameter Passing Examples](#parameter-passing-examples)

## Navigation Overview

The VIPER architecture in SwiftUI uses a centralized navigation system where:
- **NavigationService** manages navigation state
- **Router** handles navigation logic for each module
- **ApplicationViewBuilder** creates module instances with parameters
- **Assembly** configures modules with dependencies and parameters

## Module Enum Definition

First, define an enum that represents all possible modules in your application with their parameters:

```swift
enum Module: Identifiable, Equatable, Hashable {
    var id: String { stringKey }
    
    static func == (lhs: Module, rhs: Module) -> Bool {
        lhs.stringKey == rhs.stringKey
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.stringKey)
    }
    
    // Simple modules without parameters
    case Main
    case Settings
    case Profile
    
    // Modules with data parameters
    case Details(source: DetailsSource)
    case List(source: ListSource = .normal)
    case Edit(itemId: String)
    
    // Modules with completion handlers
    case Confirmation(completed: (() -> Void)?)
    case Setup(didFinish: (() -> Void)?)
    
    // Modules with multiple parameters
    case Game(source: GameSource, difficulty: GameDifficulty)
    case Report(data: ReportData, onSave: ((Bool) -> Void)?)
    
    var stringKey: String {
        switch self {
        case .Main:
            return "Main"
        case .Settings:
            return "Settings"
        case .Profile:
            return "Profile"
        case .Details:
            return "Details"
        case .List:
            return "List"
        case .Edit:
            return "Edit"
        case .Confirmation:
            return "Confirmation"
        case .Setup:
            return "Setup"
        case .Game:
            return "Game"
        case .Report:
            return "Report"
        }
    }
}
```

## Source Type Definitions

Define enums for different source types and parameters:

```swift
enum DetailsSource {
    case mainScreen
    case deepLink
    case notification
}

enum ListSource {
    case normal
    case filtered
    case favorites
}

enum GameSource {
    case demo
    case normal
    case tutorial
}

enum GameDifficulty {
    case easy
    case medium
    case hard
}

struct ReportData {
    let title: String
    let content: String
    let timestamp: Date
}

enum NavigationAlert: Identifiable, Equatable, Hashable {
    var id: Int { hashValue }
    
    static func == (lhs: NavigationAlert, rhs: NavigationAlert) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
    
    func hash(into hasher: inout Hasher) {
        switch self {
        case .deleteConfirmation:
            hasher.combine("deleteConfirmation")
        case .networkError:
            hasher.combine("networkError")
        }
    }
    
    case deleteConfirmation(yesAction: (() -> Void)?, noAction: (() -> Void)?)
    case networkError(retryAction: (() -> Void)?)
}

protocol NavigationServiceType: ObservableObject, Identifiable {
    var popup: Module? { get set }
    var items: [Module] { get set }
    var alert: NavigationAlert? { get set }
    var fullScreen: Module? { get set }
}

public final class NavigationService: NavigationServiceType {
    public let id = UUID()
    
    public static func == (lhs: NavigationService, rhs: NavigationService) -> Bool {
        lhs.id == rhs.id
    }
    
    @Published var fullScreen: Module?
    @Published var popup: Module?
    @Published var items: [Module] = []
    @Published var alert: NavigationAlert?
}
```

## Router Implementation

Each module has its own router that uses the routing service to navigate:

```swift
protocol MainRouterProtocol: RouterProtocol {
    func navigateToDetails(source: DetailsSource)
    func navigateToSettings()
    func showConfirmation(completed: (() -> Void)?)
    func navigateToProfile()
}

final class MainRouter: MainRouterProtocol {
    var navigationService: any NavigationServiceType
    
    init(navigationService: any NavigationServiceType) {
        self.navigationService = navigationService
    }
    
    // Stack navigation (push)
    func navigateToDetails(source: DetailsSource) {
        navigationService.items.append(.Details(source: source))
    }
    
    func navigateToSettings() {
        navigationService.items.append(.Settings)
    }
    
    func navigateToProfile() {
        navigationService.items.append(.Profile)
    }
    
    // Full screen presentation
    func showConfirmation(completed: (() -> Void)?) {
        navigationService.fullScreen = .Confirmation(completed: completed)
    }
    
    // Popup presentation
    func showSetup(didFinish: (() -> Void)?) {
        navigationService.popup = .Setup(didFinish: didFinish)
    }
    
    // Alert presentation  
    func showDeleteAlert(onConfirm: (() -> Void)?, onCancel: (() -> Void)?) {
        navigationService.alert = .deleteConfirmation(yesAction: onConfirm, noAction: onCancel)
    }
    
    // Navigation with complex parameters
    func navigateToGame(source: GameSource, difficulty: GameDifficulty) {
        navigationService.items.append(.Game(source: source, difficulty: difficulty))
    }
    
    // Navigate back (remove from stack)
    func navigateBack() {
        if !navigationService.items.isEmpty {
            navigationService.items.removeLast()
        }
    }
    
    // Navigate to root (clear stack)
    func navigateToRoot() {
        navigationService.items.removeAll()
    }
}
```

## ApplicationViewBuilder for Module Creation

The ApplicationViewBuilder creates module instances based on the enum cases:

```swift
final class ApplicationViewBuilder: Assembly, ObservableObject {
    
    required init(container: Container) {
        super.init(container: container)
    }
    
    @ViewBuilder
    func build(view: Module) -> some View {
        switch view {
        case .Main:
            buildMainModule()
        case .Settings:
            buildSettingsModule()
        case .Profile:
            buildProfileModule()
        case .Details(let source):
            buildDetailsModule(source: source)
        case .List(let source):
            buildListModule(source: source)
        case .Edit(let itemId):
            buildEditModule(itemId: itemId)
        case .Confirmation(let completed):
            buildConfirmationModule(completed: completed)
        case .Setup(let didFinish):
            buildSetupModule(didFinish: didFinish)
        case .Game(let source, let difficulty):
            buildGameModule(source: source, difficulty: difficulty)
        case .Report(let data, let onSave):
            buildReportModule(data: data, onSave: onSave)
        }
    }
    
    // Private builder methods
    @ViewBuilder
    private func buildMainModule() -> some View {
        container.resolve(MainAssembly.self).build()
    }
    
    @ViewBuilder
    private func buildDetailsModule(source: DetailsSource) -> some View {
        container.resolve(DetailsAssembly.self).build(source: source)
    }
    
    @ViewBuilder
    private func buildGameModule(source: GameSource, difficulty: GameDifficulty) -> some View {
        container.resolve(GameAssembly.self).build(source: source, difficulty: difficulty)
    }
    
    @ViewBuilder
    private func buildConfirmationModule(completed: (() -> Void)?) -> some View {
        container.resolve(ConfirmationAssembly.self).build(completed: completed)
    }
    
    @ViewBuilder
    private func buildReportModule(data: ReportData, onSave: ((Bool) -> Void)?) -> some View {
        container.resolve(ReportAssembly.self).build(data: data, onSave: onSave)
    }
}
```

## Assembly with Parameters

Module assemblies handle dependency injection and parameter passing:

```swift
// Simple assembly without parameters
final class MainAssembly: Assembly {
    func build() -> some View {
        let navigationService = container.resolve(NavigationAssembly.self).build()
        let dataService = container.resolve(DataServiceAssembly.self).build()
        
        let router = MainRouter(navigationService: navigationService)
        let interactor = MainInteractor(dataService: dataService)
        let viewState = MainViewState()
        let presenter = MainPresenter(router: router, interactor: interactor, viewState: viewState)
        
        viewState.set(with: presenter)
        
        return MainView(viewState: viewState)
    }
}

// Assembly with source parameter
final class DetailsAssembly: Assembly {
    func build(source: DetailsSource) -> some View {
        let navigationService = container.resolve(NavigationAssembly.self).build()
        let dataService = container.resolve(DataServiceAssembly.self).build()
        let analyticsService = container.resolve(AnalyticsServiceAssembly.self).build()
        
        let router = DetailsRouter(navigationService: navigationService)
        let interactor = DetailsInteractor(
            dataService: dataService,
            analyticsService: analyticsService,
            source: source
        )
        let viewState = DetailsViewState()
        let presenter = DetailsPresenter(
            router: router,
            interactor: interactor,
            viewState: viewState,
            source: source
        )
        
        viewState.set(with: presenter)
        
        return DetailsView(viewState: viewState)
    }
}

// Assembly with multiple parameters
final class GameAssembly: Assembly {
    func build(source: GameSource, difficulty: GameDifficulty) -> some View {
        let navigationService = container.resolve(NavigationAssembly.self).build()
        let gameService = container.resolve(GameServiceAssembly.self).build()
        let scoreService = container.resolve(ScoreServiceAssembly.self).build()
        
        let router = GameRouter(navigationService: navigationService)
        let interactor = GameInteractor(
            gameService: gameService,
            scoreService: scoreService,
            source: source,
            difficulty: difficulty
        )
        let viewState = GameViewState()
        let presenter = GamePresenter(
            router: router,
            interactor: interactor,
            viewState: viewState,
            source: source,
            difficulty: difficulty
        )
        
        viewState.set(with: presenter)
        
        return GameView(viewState: viewState)
    }
}

// Assembly with completion handler
final class ConfirmationAssembly: Assembly {
    func build(completed: (() -> Void)?) -> some View {
        let navigationService = container.resolve(NavigationAssembly.self).build()
        
        let router = ConfirmationRouter(navigationService: navigationService)
        let interactor = ConfirmationInteractor(completed: completed)
        let viewState = ConfirmationViewState()
        let presenter = ConfirmationPresenter(
            router: router,
            interactor: interactor,
            viewState: viewState
        )
        
        viewState.set(with: presenter)
        
        return ConfirmationView(viewState: viewState)
    }
}
```

## RootView Setup

The RootView manages different presentation styles:

```swift
struct RootView: View {
    @ObservedObject var navigationService: NavigationService
    @ObservedObject var applicationViewBuilder: ApplicationViewBuilder
    
    var body: some View {
        NavigationStack(path: $navigationService.items) {
            applicationViewBuilder.build(view: .Main)
                .navigationDestination(for: Module.self) { module in
                    applicationViewBuilder.build(view: module)
                }
        }
        .fullScreenCover(item: $navigationService.popup) { module in
            applicationViewBuilder.build(view: module)
                .presentationBackground(.clear)
        }
        .fullScreenCover(item: $navigationService.fullScreen) { module in
            applicationViewBuilder.build(view: module)
        }
        .alert(item: $navigationService.alert) { alertType in
            buildAlert(for: alertType)
        }
    }
    
    private func buildAlert(for alertType: NavigationAlert) -> Alert {
        switch alertType {
        case .deleteConfirmation(let yesAction, let noAction):
            return Alert(
                title: Text("Delete Item"),
                message: Text("Are you sure you want to delete this item?"),
                primaryButton: .destructive(Text("Delete"), action: yesAction),
                secondaryButton: .cancel(Text("Cancel"), action: noAction)
            )
        case .networkError(let retryAction):
            return Alert(
                title: Text("Network Error"),
                message: Text("Please check your connection and try again."),
                primaryButton: .default(Text("Retry"), action: retryAction),
                secondaryButton: .cancel()
            )
        }
    }
}
```

## Navigation Types

### 1. Stack Navigation (Push/Pop)
```swift
// Push to stack
navigationService.items.append(.Details(source: .mainScreen))

// Pop from stack
navigationService.items.removeLast()

// Pop to root
navigationService.items.removeAll()
```

### 2. Full Screen Presentation
```swift
// Present full screen
navigationService.fullScreen = .Confirmation(completed: {
    print("Confirmation completed")
})

// Dismiss full screen
navigationService.fullScreen = nil
```

### 3. Popup Presentation
```swift
// Present popup
navigationService.popup = .Setup(didFinish: {
    print("Setup finished")
})

// Dismiss popup
navigationService.popup = nil
```

### 4. Alert Presentation
```swift
// Show alert
navigationService.alert = .deleteConfirmation(
    yesAction: { print("Deleted") },
    noAction: { print("Cancelled") }
)

// Dismiss alert
navigationService.alert = nil
```

## Parameter Passing Examples

### 1. Simple Data Parameters
```swift
// Passing string ID
navigationService.items.append(.Edit(itemId: "item123"))

// Passing enum source
navigationService.items.append(.List(source: .favorites))
```

### 2. Complex Object Parameters
```swift
let reportData = ReportData(
    title: "Monthly Report",
    content: "Report content here...",
    timestamp: Date()
)

navigationService.items.append(.Report(
    data: reportData,
    onSave: { success in
        print("Report saved: \(success)")
    }
))
```

### 3. Completion Handlers
```swift
navigationService.popup = .Setup(didFinish: {
    // Called when setup is completed
    self.refreshData()
    self.navigationService.popup = nil
})
```

### 4. Multiple Parameters
```swift
navigationService.items.append(.Game(
    source: .normal,
    difficulty: .hard
))
```

## Best Practices

### 1. Type Safety
- Use enums for module definitions and source types
- Leverage Swift's type system to prevent navigation errors

### 2. Parameter Validation
- Validate parameters in assembly or interactor
- Provide default values where appropriate

### 3. Memory Management
- Use weak references in completion handlers when needed
- Properly manage view lifecycle

### 4. Testing
- Mock NavigationServiceType for unit testing
- Test navigation flows with different parameters

### 5. Documentation
- Document expected parameters for each module
- Provide examples of common navigation patterns

This documentation provides a comprehensive guide for implementing navigation and parameter passing in SwiftUI VIPER architecture, ensuring type safety and maintainability.


## Author

🧑🏻‍💻 Artem Tishchenko [Personal Blog](https://www.linkedin.com/in/tim-tis/)


## License

MIT License

Copyright (c) 2023 Artem Tishchenko

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

BASED ON: [Core iOS Application Architecture](https://github.com/bartleby/Core-iOS-Application-Architecture)

## Special thanks
* Artem Korenev - [LinkedIn](https://www.linkedin.com/in/artem-korenev-42b320243/)
* Aleksei Artemev - [iDevs.io](https://idevs.io)
* CustomerTimes iOS team - [Customertimes.com](https://customertimes.com/)

## ☕️ Donate:
If you find this repository useful, you can thank me

[![](https://img.shields.io/badge/-Buy%20me%20a%20coffee-EDD347?logo=ko-fi)](https://www.buymeacoffee.com/x68mf5jw4yl) 

Or give a star the repository

[![](https://img.shields.io/badge/Star_on-GitHub-lightgrey.svg)](https://github.com/maukur/SwiftUI-Viper-Architecture)<br>


