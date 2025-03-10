//
//  RCNavigationPath.swift
//  CoordinatorExample
//
//  Created by Radun Çiçen on 6.03.2025.
//

public enum RCNavigationPath<Route> {
    case start(Route)
    case swap(_ route: Route, popUpToIdentifier: String?)
    case pop
}
