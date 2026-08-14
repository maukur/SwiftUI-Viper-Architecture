//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//  ___COPYRIGHT___
//

import Foundation

protocol AssemblyFactoryProtocol: AnyObject {
    func apply<T: AssemblyType>(_ assembly: T.Type, name: String?)
    func resolve<T: AssemblyType>(_ type: T.Type, name: String?) -> T.Type
}

class AssemblyFactory {
    typealias AssemblyCollection = [String: Any.Type]
    fileprivate var assemblyCollection = AssemblyCollection()
}

extension AssemblyFactory: AssemblyFactoryProtocol {
    func apply<T: AssemblyType>(_ assembly: T.Type, name: String? = nil) {
        let key = ObjectKey(assembly, name: name).key
        assemblyCollection[key] = assembly
    }

    /// An assembly that was never applied resolves to itself, so a new module works
    /// out of the box and `apply( _:)` is only needed to substitute an implementation,
    /// for tests or previews.
    func resolve<T: AssemblyType>(_ type: T.Type, name: String? = nil) -> T.Type {
        let key = ObjectKey(type, name: name).key
        return assemblyCollection[key] as? T.Type ?? type
    }
}
