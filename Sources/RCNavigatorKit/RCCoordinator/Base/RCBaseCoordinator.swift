//
//  RCBaseCoordinator.swift
//  CoordinatorExample
//
//  Created by Radun Çiçen on 6.03.2025.
//
import UIKit

open class RCBaseCoordinator<Route, DataDelegate>: RCCoordinator {
    public let navigationController: UINavigationController
    public var _navigator: any RCNavigator
    public var navigator: AnyNavigator<Route>

    weak private var weakDelegate: AnyObject?

    public var typedDelegate: DataDelegate? {
        get { weakDelegate as? DataDelegate }
        set { weakDelegate = newValue as? AnyObject }
    }

    public var delegate: (any RCCoordinatorDelegate)? {
        get { weakDelegate as? RCCoordinatorDelegate }
        set {
            guard newValue != nil else {
                weakDelegate = nil
                return
            }
            if !(newValue is DataDelegate) {
                assertionFailure("In correct navDelegate type.")
            }
            weakDelegate = newValue
        }
    }

    required public init(
        navigationController: UINavigationController,
        navigator: AnyNavigator<Route>
    ) {
        self.navigationController = navigationController
        self.navigator = navigator
        self._navigator = navigator
    }
}
