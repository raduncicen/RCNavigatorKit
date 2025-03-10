//
//  RCAnyNavigator.swift
//  CoordinatorExample
//
//  Created by Radun Çiçen on 6.03.2025.
//

import UIKit

public class AnyNavigator<Route>: RCNavigator {
    private let _navigate: (RCNavigationPath<Route>) -> Void
    private let _popUntil: (RCNavigationPath<Route>) -> Void
    private let _removeChildCoordinator: (String?) -> Void
    private let _removeChildCoordinatorForSwipeDismiss: (String?) -> Void

    private var navigator: (any RCNavigator)
    
    public var childCoordinators: [RCCoordinator] {
        get { navigator.childCoordinators }
        set { navigator.childCoordinators = newValue }

    }

    public init<Navigator: RCNavigator>(_ navigator: Navigator) where Navigator.Route == Route {
        self.navigator = navigator
        self._navigate = navigator.navigate
        self._popUntil = navigator.popUntil
        self._removeChildCoordinator = navigator.removeChildCoordinator
        self._removeChildCoordinatorForSwipeDismiss = navigator.removeChildCoordinatorForSwipeDismiss
    }

    public func navigate(to path: RCNavigationPath<Route>) {
        _navigate(path)
    }

    public func popUntil(_ path: RCNavigationPath<Route>) {
        _popUntil(path)
    }

    public func removeChildCoordinator(with identifier: String?) {
        _removeChildCoordinator(identifier)
    }

    public func removeChildCoordinatorForSwipeDismiss(with identifier: String?) {
        _removeChildCoordinatorForSwipeDismiss(identifier)
    }
}
