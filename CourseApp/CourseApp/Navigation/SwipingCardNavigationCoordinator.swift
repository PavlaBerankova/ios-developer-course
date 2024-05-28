//
//  SwipingNavigationCoordinator.swift
//  CourseApp
//
//  Created by Pavla Beránková on 28.05.2024.
//

import UIKit
import SwiftUI

final class SwipingCardNavigationCoordinator: NSObject, NavigationControllerCoordinator {
    private(set) lazy var navigationController: UINavigationController = UINavigationController()

    var childCoordinators = [Coordinator]()
    func start() {
        navigationController.setViewControllers(
            [makeSwipingCard(), makeSwipingCard(), makeSwipingCard()],
            animated: false
        )
    }
}

// MARK: - Factories
private extension SwipingCardNavigationCoordinator {
    func makeSwipingCard() -> UIViewController {
        UIHostingController(rootView: SwipingView())
    }
}
