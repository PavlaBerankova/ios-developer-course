//
//  AppCoordinator.swift
//  CourseApp
//
//  Created by Pavla Beránková on 24.05.2024.
//

import UIKit

protocol AppCoordinating: ViewControllerCoordinator { }

final class AppCoordinator: AppCoordinating {
    private(set) lazy var rootViewController = makeTabBarFlow()

    var childCoordinators = [Coordinator]()
}

// MARK: - Start coordinator
extension AppCoordinator {
    func start() {
        setupGlobalTabBarUI()
    }

    func setupGlobalTabBarUI() {
        let tabBarAppearance = UITabBarAppearance()
        UITabBar.appearance().backgroundColor = UIColor.main
        tabBarAppearance.stackedLayoutAppearance.normal.iconColor = UIColor.gray
        tabBarAppearance.stackedLayoutAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.gray]
        tabBarAppearance.stackedLayoutAppearance.selected.iconColor = UIColor.black
        tabBarAppearance.stackedLayoutAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]

        UITabBar.appearance().standardAppearance = tabBarAppearance
    }

    func makeTabBarFlow() -> UIViewController {
        let coordinator = MainTabBarCoordinator()
        childCoordinators.append(coordinator)
        coordinator.start()
        return coordinator.rootViewController
    }
}
