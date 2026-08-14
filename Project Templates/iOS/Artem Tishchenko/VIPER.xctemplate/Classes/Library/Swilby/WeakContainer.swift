//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//  ___COPYRIGHT___
//

import Foundation

/// Holds a weak reference to a boxed object.
///
/// Deliberately non-generic: a generic version makes the Swift 6.3 optimizer
/// crash in `EarlyPerfInliner` while building in Release.
final class WeakContainer {
    private weak var _value: AnyObject?

    var value: AnyObject? {
        get { _value }
        set { _value = newValue }
    }

    init(value: AnyObject) {
        _value = value
    }
}
