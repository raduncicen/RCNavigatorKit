
A code-snippet for quick initialization of a new Coordinator

```
import RCNavigatorKit
import SwiftUI

public protocol <###Name###>CoordinatorDelegate: RCCoordinatorDelegate {

}

protocol <###Name###>Coordinator: RCCoordinator {
   func start(popUpToIdentifier: String?)
}

class <###Name###>CoordinatorImpl: RCBaseCoordinator<AppRoute, <###Name###>CoordinatorDelegate>, <###Name###>Coordinator {
   func start(popUpToIdentifier: String?) {

   }
}
```
