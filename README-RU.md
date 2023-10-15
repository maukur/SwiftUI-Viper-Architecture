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

VIPER (View, Interactor, Presenter, Entity, Router) — это архитектурный паттерн для построения приложений. В SwiftUI, этот паттерн не так распространен как в UIKit, но его все еще можно использовать для организации кода, если прибегнуть к маленькой хитрости и добавить такую сущность как ViewState.

Для чего нужен ViewState и на какой концепции он основан ?

ViewState (состояние представления) аналогичен @IBOutlet свойствам и данным, хранящимся в viewController, но в новой концепции с использованием @Published свойств и view.

Давайте проясним это с помощью аналогии:

#### Storyboard и ViewController:
- Storyboard представляет собой визуальное представление пользовательского интерфейса, в котором вы размещаете элементы интерфейса, такие как кнопки, текстовые поля и др. Он отвечает за организацию и расположение элементов.
- ViewController - это объект, управляющий взаимодействием между данными и интерфейсом. Он содержит логику, которая обрабатывает ввод пользователя, обновляет представление и работает с данными.
#### View и ViewState:
- View представляет собой базовый строительный блок в пользовательском интерфейсе. Это абстракция, которая отображает часть пользовательского интерфейса, такую как кнопка, текстовое поле, изображение и т.д.
- ViewState - это абстракция, представляющая собой состояние представления в Swift. Она содержит данные, необходимые для отображения текущего состояния интерфейса. Это может быть, например, текущий текст в текстовом поле, выбранный элемент в таблице и т.д.

### SwiftUI Viper Architecture:

#### View:
- Отвечает за отображение данных пользователю и взаимодействие с пользователем.
- Обрабатывает пользовательский ввод и передает его презентеру для обработки.

#### ViewState:
- Контролирует взаимодействие между Presenter и View.
- Отвечает за хранение отображаемых данных в пользовательском интерфейсе.
- Принимает пользовательский ввод от представления и преобразует в команды для презентера.

#### Interactor:
- Содержит бизнес-логику и правила для обработки данных.
- Отвечает за запросы к хранилищу данных (например, базе данных, сети) и их обработку перед представлением.
- Не содержит кода, связанного с отображением или интерфейсом пользователя.

#### Presenter:
- Отвечает за обработку данных от интерактора и подготовку их для отображения в пользовательском интерфейсе.
- Контролирует взаимодействие между интерактором и представлением.
- Принимает пользовательский ввод от представления, обрабатывает его и преобразует в команды для интерактора.

#### Entity (Model):
- Представляет собой объекты данных, которые используются в приложении.
- Обычно является простыми объектами данных без методов, содержащими только свойства.

#### Router:
- Отвечает за навигацию между экранами приложения.
- Решает, какой экран должен быть показан в ответ на определенные действия пользователя.

## Installation

Only need execute this command in terminal:

```swift
swift install.swift
```

## Requirements

* Xcode 10+
* Swift 4.2+

## Example project

[Download](https://github.com/maukur/SwiftUI-Viper-Example/) example project built on the basis of this paradigm.


## Usage

### Create a new Project

```swift
Open Xcode
File > New > Project or press shortcuts ⇧⌘N
Choice VIPER Architecture
Profit! 🎉
```
#### Project structure
 ```swift
┌── ApplicationViewBuilder.swift
├── RootApp.swift
├── RootView.swift
└── Classes
     ├── Modules
     │   └── Main
     │       ├── Assembly
     │       │   └── MainAssembly.swift
     │       ├── Contracts
     │       │   └── MainContracts.swift
     │       ├── Interactor
     │       │   └── MainInteractor.swift
     │       ├── Presenter
     │       │   └── MainPresenter.swift
     │       ├── Router
     │       │   └── MainRouter.swift
     │       ├── View
     │       │   └── MainView.swift
     │       └── ViewState
     │           └── MainViewState.swift
     ├── Services
     │   └── NavigationService
     │       ├── NavigationAssembly.swift
     │       ├── NavigationService.swift
     │       └── NavigationServiceType.swift
     ├── Architecture
     │   ├── InteractorProtocol.swift
     │   ├── PresenterProtocol.swift
     │   ├── RouterProtocol.swift
     │   └── ViewStateProtocol.swift   
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
Choice Module or Service
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
Choice Module or Service
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
