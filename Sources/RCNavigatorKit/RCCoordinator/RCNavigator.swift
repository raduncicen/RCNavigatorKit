//
//  AppNavigator.swift
//  CoordinatorExample
//
//  Created by Radun Çiçen on 1.03.2025.
//

import Combine
import SwiftUI

public protocol RCNavigator: AnyObject {
    associatedtype Route
    var childCoordinators: [RCCoordinator] { get set }
//    var currentPaths: [RCNavigationPath<Route>] { get }

    func navigate(to path: RCNavigationPath<Route>)
    func popUntil(_ path: RCNavigationPath<Route>)

    func removeChildCoordinator(with identifier: String?)
    func removeChildCoordinatorForSwipeDismiss(with identifier: String?)
}

extension RCNavigator {
    public func removeChildCoordinator(with identifier: String?) {
        removeChild(id: identifier)
    }

    /// This function is for `RCHostingController` and should only be called from there when a dismiss action occurs through an interactive swipe gesture or default navigation back bar button.
    public func removeChildCoordinatorForSwipeDismiss(with identifier: String?) {
        removeChild(id: identifier)
    }

    @discardableResult
    private func removeChild(id rootViewControllerIdentifier: String?) -> RCCoordinator? {
        guard let rootViewControllerIdentifier, let index = childCoordinators.lastIndex(where: { $0.rootViewControllerIdentifier == rootViewControllerIdentifier }) else {
            return nil
        }
        let removedChild = childCoordinators.remove(at: index)
//        devLog("CHILD_COORDINATOR_REMOVED: Parent:\(self) - Child: \(removedChild.self)")
        return removedChild
    }

    @discardableResult
    private func popLastChild() -> (any RCCoordinator)? {
        let removedChild = childCoordinators.popLast()
//        devLog("CHILD_COORDINATOR_REMOVED: Parent:\(self) - Child: \(String(describing: removedChild.self))")
        return removedChild
    }

    func resetChilds() {
//        devLog("CHILD_COORDINATOR_REMOVED: Parent:\(self) - Removed All Childs (Count: \(childCoordinators.count))")
        childCoordinators = []
    }
}

