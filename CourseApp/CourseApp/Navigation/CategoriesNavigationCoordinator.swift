//
//  CategoriesNavigationCoordinator.swift
//  CourseApp
//
//  Created by Pavla Beránková on 28.05.2024.
//

import SwiftUI
import UIKit

final class CategoriesNavigationCoordinator: NSObject, NavigationControllerCoordinator {
    private(set) lazy var navigationController: UINavigationController = UINavigationController()

    var childCoordinators = [Coordinator]()
    func start() {
        navigationController.setViewControllers(
            [HomeViewController()],
            animated: false
        )
    }
}
