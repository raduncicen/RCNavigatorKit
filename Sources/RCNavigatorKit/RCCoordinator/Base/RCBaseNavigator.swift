//
//  RCBaseNavigator.swift
//  CoordinatorExample
//
//  Created by Radun Çiçen on 6.03.2025.
//

import UIKit

public class RCBaseNavigator<Route>: RCNavigator {
    let navigationController: UINavigationController
    public var childCoordinators: [RCCoordinator] = []

    private var coordinatorIdentifiers: [(navigationPath: RCNavigationPath<Route>, id:String)] = []

    var currentPaths: [RCNavigationPath<Route>] {
        coordinatorIdentifiers.map(\.navigationPath)
    }

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    public func navigate(to path: RCNavigationPath<Route>) {
        assertionFailure("You should implement this")
    }

    public func popUntil(_ path: RCNavigationPath<Route>) {
        assertionFailure("You should implement this")
//        guard let coordinatorIndex = coordinatorIdentifiers.lastIndex(where: { $0.navigationPath == path }) else { return }
//        let coordinatorId = coordinatorIdentifiers[coordinatorIndex].id
//        navigationController.popViewControllers(upTo: coordinatorId)
    }

    public func setDelegateIfAvailable(_ coordinator: RCCoordinator) {
        guard let currentCoordinator = childCoordinators.last as? RCDataDelegate else { return }
        coordinator.delegate = currentCoordinator
    }
}

