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


