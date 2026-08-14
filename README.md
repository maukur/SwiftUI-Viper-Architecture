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
     │       ├── Module
     │       │   └── MainModule.swift
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
     │   ├── ViewStateProtocol.swift
     │   ├── Module.swift
     │   └── AnyModule.swift
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
├── Module
├── Presenter
├── Router
├── View
└── ViewState
```
#### Setup Modules
Nothing to set up: `Module/<Name>Module.swift` is the screen's entry point, and routers
navigate to it right away.

```swift
navigation.push(.Profile)
```

An assembly that was never applied resolves to itself, so `container.apply( _:)` in
RootApp.swift is only needed when you want to substitute an implementation, for tests
or previews:

```swift
container.apply(MockProfileAssembly.self)
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
A service is ready as soon as its assembly exists — modules reach it through
`container.resolve(NetworkAssembly.self).build()`. Register it in RootApp.swift only to
swap the implementation:

```swift
container.apply(MockNetworkAssembly.self)
```

# Navigation and Parameter Passing in SwiftUI VIPER Architecture

This document provides examples of how to implement navigation between modules and pass parameters in SwiftUI VIPER architecture based on real application patterns.

## Table of Contents
- [Navigation Overview](#navigation-overview)
- [Module Definition](#module-definition)
- [Source Type Definitions](#source-type-definitions)
- [Router Implementation](#router-implementation)
- [ApplicationViewBuilder](#applicationviewbuilder)
- [Assembly with Parameters](#assembly-with-parameters)
- [RootView Setup](#rootview-setup)
- [Navigation Types](#navigation-types)
- [Parameter Passing Examples](#parameter-passing-examples)

## Navigation Overview

The VIPER architecture in SwiftUI uses a centralized navigation system where:
- **Module** is a value declared by the screen itself that knows how to build it
- **AnyModule** is the type-erased form the navigation service stores
- **NavigationService** manages navigation state — stack, modal, popup and alert
- **Router** handles navigation logic for each module
- **Assembly** configures modules with dependencies and parameters

A new screen brings its own module value, so adding one changes no shared file: no
enum to extend, no `switch` to keep in sync, no registration to forget. The compiler
enforces the contract — a module that does not say how it is built does not conform to
`Module`.

## Module Definition

Each screen declares its entry point in its own `Module` folder. The Xcode module
template generates one for you:

```swift
// Simple module without parameters
struct ProfileModule: Module {
    func build(container: Container) -> some View {
        container.resolve(ProfileAssembly.self).build()
    }
}

// Puts the module into code completion: navigation.push(.Profile)
extension Module where Self == ProfileModule {
    static var Profile: Self { Self() }
}
```

The extension is what brings back the enum feel: type a dot in any navigation call and
Xcode lists every module in the project. The template generates it for you, so a new
screen shows up in completion the moment it is created.

Parameters are stored properties, so they stay type checked all the way from the router
to the assembly:

```swift
// Module with a data parameter
struct DetailsModule: Module {
    let source: DetailsSource

    func build(container: Container) -> some View {
        container.resolve(DetailsAssembly.self).build(source: source)
    }
}

// Parameters turn the property into a function: navigation.push(.Details(source: .deepLink))
extension Module where Self == DetailsModule {
    static func Details(source: DetailsSource) -> Self { Self(source: source) }
}

// Module with multiple parameters
struct GameModule: Module {
    let source: GameSource
    let difficulty: GameDifficulty

    func build(container: Container) -> some View {
        container.resolve(GameAssembly.self).build(source: source, difficulty: difficulty)
    }
}

extension Module where Self == GameModule {
    static func Game(source: GameSource, difficulty: GameDifficulty) -> Self {
        Self(source: source, difficulty: difficulty)
    }
}

// Module with a default value
struct ListModule: Module {
    let source: ListSource

    init(source: ListSource = .normal) {
        self.source = source
    }

    func build(container: Container) -> some View {
        container.resolve(ListAssembly.self).build(source: source)
    }
}

extension Module where Self == ListModule {
    static func List(source: ListSource = .normal) -> Self { Self(source: source) }
}
```

`Module` inherits `Hashable`, which SwiftUI needs to drive the navigation stack. For a
module carrying a closure the conformance cannot be synthesized — closures have no
identity — so spell it out:

```swift
struct ConfirmationModule: Module {
    let completed: (() -> Void)?

    // Identity is the module itself: two confirmations are the same destination
    static func == (lhs: Self, rhs: Self) -> Bool { true }

    func hash(into hasher: inout Hasher) {
        hasher.combine("Confirmation")
    }

    func build(container: Container) -> some View {
        container.resolve(ConfirmationAssembly.self).build(completed: completed)
    }
}

extension Module where Self == ConfirmationModule {
    static func Confirmation(completed: (() -> Void)?) -> Self { Self(completed: completed) }
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

struct ReportData: Hashable {
    let title: String
    let content: String
    let timestamp: Date
}
```

Types used inside a module have to be `Hashable` too, which the compiler will tell you
the moment they are not.

## Router Implementation

Each module has its own router that uses the navigation service to navigate:

```swift
protocol MainRouterProtocol: RouterProtocol {
    func navigateToDetails(source: DetailsSource)
    func navigateToSettings()
    func showConfirmation(completed: (() -> Void)?)
    func navigateToProfile()
}

final class MainRouter: MainRouterProtocol {
    var navigation: any NavigationServiceType

    init(navigation: any NavigationServiceType) {
        self.navigation = navigation
    }

    // Stack navigation (push)
    func navigateToDetails(source: DetailsSource) {
        navigation.push(.Details(source: source))
    }

    func navigateToSettings() {
        navigation.push(.Settings)
    }

    func navigateToProfile() {
        navigation.push(.Profile)
    }

    // Full screen presentation
    func showConfirmation(completed: (() -> Void)?) {
        navigation.present(modal: .Confirmation(completed: completed))
    }

    // Popup presentation
    func showSetup(didFinish: (() -> Void)?) {
        navigation.present(popup: .Setup(didFinish: didFinish))
    }

    // Alert presentation
    func showDeleteAlert(onConfirm: (() -> Void)?, onCancel: (() -> Void)?) {
        navigation.alert = .defaultAlert(yesAction: onConfirm, noAction: onCancel)
    }

    // Navigation with complex parameters
    func navigateToGame(source: GameSource, difficulty: GameDifficulty) {
        navigation.push(.Game(source: source, difficulty: difficulty))
    }

    // Navigate back (remove from stack)
    func navigateBack() {
        navigation.pop()
    }

    // Navigate to root (clear stack)
    func navigateToRoot() {
        navigation.popToRoot()
    }
}
```

## ApplicationViewBuilder

The builder turns a module into a view against the application container. It holds no
per-screen knowledge, so it never has to be edited:

```swift
final class ApplicationViewBuilder: Assembly, ObservableObject {
    required init(container: Container) {
        super.init(container: container)
    }

    @ViewBuilder
    func build(module: some Module) -> some View {
        module.build(container: container)
    }

    @ViewBuilder
    func build(module: AnyModule) -> some View {
        module.build(container: container)
    }
}
```

That also makes it the entry point for previews of any screen in the app:

```swift
#Preview {
    ApplicationViewBuilder.stub.build(module: .Details(source: .mainScreen))
}
```

## Assembly with Parameters

Module assemblies handle dependency injection and parameter passing:

```swift
// Simple assembly without parameters
final class MainAssembly: Assembly {
    func build() -> some View {
        let navigation = container.resolve(NavigationAssembly.self).build()
        let dataService = container.resolve(DataServiceAssembly.self).build()

        let router = MainRouter(navigation: navigation)
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
        let navigation = container.resolve(NavigationAssembly.self).build()
        let dataService = container.resolve(DataServiceAssembly.self).build()
        let analyticsService = container.resolve(AnalyticsServiceAssembly.self).build()

        let router = DetailsRouter(navigation: navigation)
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
        let navigation = container.resolve(NavigationAssembly.self).build()
        let gameService = container.resolve(GameServiceAssembly.self).build()
        let scoreService = container.resolve(ScoreServiceAssembly.self).build()

        let router = GameRouter(navigation: navigation)
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
        let navigation = container.resolve(NavigationAssembly.self).build()

        let router = ConfirmationRouter(navigation: navigation)
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
        .alert(isPresented: .constant(navigationService.alert != nil)) {
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
```

Only the root screen is named here. Every other destination arrives as an `AnyModule`
that already knows how to build itself.

## Navigation Types

### 1. Stack Navigation (Push/Pop)
```swift
// Push to stack
navigation.push(.Details(source: .mainScreen))

// Pop from stack
navigation.pop()

// Pop to root
navigation.popToRoot()
```

### 2. Full Screen Presentation
```swift
// Present full screen
navigation.present(modal: .Confirmation(completed: {
    print("Confirmation completed")
}))

// Dismiss full screen
navigation.dismissModal()
```

### 3. Popup Presentation
```swift
// Present popup
navigation.present(popup: .Setup(didFinish: {
    print("Setup finished")
}))

// Dismiss popup
navigation.dismissPopup()
```

### 4. Alert Presentation
```swift
// Show alert
navigation.alert = .defaultAlert(
    yesAction: { print("Deleted") },
    noAction: { print("Cancelled") }
)

// Dismiss alert
navigation.alert = nil
```

## Parameter Passing Examples

### 1. Simple Data Parameters
```swift
// Passing string ID
navigation.push(.Edit(itemID: "item123"))

// Passing enum source
navigation.push(.List(source: .favorites))
```

### 2. Complex Object Parameters
```swift
let reportData = ReportData(
    title: "Monthly Report",
    content: "Report content here...",
    timestamp: Date()
)

navigation.push(.Report(
    data: reportData,
    onSave: { success in
        print("Report saved: \(success)")
    }
))
```

### 3. Completion Handlers
```swift
navigation.present(popup: .Setup(didFinish: { [weak self] in
    // Called when setup is completed
    self?.refreshData()
    self?.navigation.dismissPopup()
}))
```

### 4. Multiple Parameters
```swift
navigation.push(.Game(
    source: .normal,
    difficulty: .hard
))
```

### 5. Reading a Module Back
```swift
// Modules are stored erased, unwrap them with their own type
if let details = navigation.items.last?.unwrap(as: DetailsModule.self) {
    print(details.source)
}
```

## Best Practices

### 1. Type Safety
- Keep parameters as stored properties of the module — they stay checked end to end
- Keep the `extension Module where Self == ...` next to every module, it is what keeps
  the whole app navigable from code completion
- Let the compiler do the bookkeeping: an unbuildable module is a build error, not a
  crash at runtime

### 2. Parameter Validation
- Validate parameters in assembly or interactor
- Provide default values in the module initializer where appropriate

### 3. Memory Management
- Use weak references in completion handlers when needed
- Properly manage view lifecycle

### 4. Testing
- Mock NavigationServiceType for unit testing
- Substitute an assembly with `container.apply( _:)` to build a module with test doubles
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


