//
//  ProfileNavigationCoordinator.swift
//  CourseApp
//
//  Created by Pavla Beránková on 28.05.2024.
//

import SwiftUI
import UIKit

final class ProfileNavigationCoordinator: NSObject, NavigationControllerCoordinator {
    private(set) lazy var navigationController: UINavigationController = UINavigationController()

    var childCoordinators = [Coordinator]()
    func start() {
        navigationController.setViewControllers(
            [makeProfile()],
            animated: false
        )
    }
}

// MARK: - Factories
private extension ProfileNavigationCoordinator {
    func makeProfile() -> UIViewController {
        UIHostingController(rootView: ProfileView())
    }
}
