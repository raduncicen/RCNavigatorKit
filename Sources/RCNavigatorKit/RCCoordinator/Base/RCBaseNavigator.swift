//
//  RCBaseNavigator.swift
//  CoordinatorExample
//
//  Created by Radun Çiçen on 6.03.2025.
//

import UIKit

open class RCBaseNavigator<Route>: RCNavigator {
    public let navigationController: UINavigationController
    public var childCoordinators: [RCCoordinator] = []

    private var coordinatorIdentifiers: [(navigationPath: RCNavigationPath<Route>, id:String)] = []

    public var currentPaths: [RCNavigationPath<Route>] {
        coordinatorIdentifiers.map(\.navigationPath)
    }

    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    open func navigate(to path: RCNavigationPath<Route>) {
        assertionFailure("You should implement this")
    }

    open func popUntil(_ path: RCNavigationPath<Route>) {
        assertionFailure("You should implement this")
//        guard let coordinatorIndex = coordinatorIdentifiers.lastIndex(where: { $0.navigationPath == path }) else { return }
//        let coordinatorId = coordinatorIdentifiers[coordinatorIndex].id
//        navigationController.popViewControllers(upTo: coordinatorId)
    }

    public func setDelegateIfAvailable(_ coordinator: RCCoordinator) {
        guard let currentCoordinator = childCoordinators.last as? RCCoordinatorDelegate else { return }
        coordinator.delegate = currentCoordinator
    }
}

