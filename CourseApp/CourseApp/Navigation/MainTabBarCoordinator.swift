//
//  MainTabBarCoordinator.swift
//  CourseApp
//
//  Created by Pavla Beránková on 24.05.2024.
//

import SwiftUI
import UIKit

final class MainTabBarCoordinator: NSObject, TabBarControllerCoordinator {
    var childCoordinators = [Coordinator]()
    private(set) lazy var tabBarController = makeTabBarController()
}

// MARK: - Start coordinator
extension MainTabBarCoordinator {
    func start() {
        tabBarController.viewControllers = [
            setupCategoriesViewController(),
            setupSwipingViewController(),
            setupProfileViewController()
        ]
    }
}

// MARK: - Factory method
private extension MainTabBarCoordinator {
    func setupNavigationBarAppearance(navigationController: UINavigationController, navigationBarTitle: String) {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor.main
        appearance.shadowImage = UIImage()
        appearance.titleTextAttributes = [.foregroundColor: TextType.navTitle.uiColor]
        appearance.largeTitleTextAttributes = [.foregroundColor: TextType.navTitle.uiColor]
        navigationController.topViewController?.title = navigationBarTitle

        navigationController.navigationBar.standardAppearance = appearance
        navigationController.navigationBar.compactAppearance = appearance
        navigationController.navigationBar.scrollEdgeAppearance = appearance
    }

    func makeTabBarController() -> UITabBarController {
        let tabBarController = UITabBarController()
        tabBarController.delegate = self
        return tabBarController
    }

    func setupCategoriesViewController() -> UIViewController {
        let categoriesCoordinator = CategoriesNavigationCoordinator()
        startChildCoordinator(categoriesCoordinator)
        // let categoriesTabViewController = UINavigationController(rootViewController: HomeViewController())
        categoriesCoordinator.rootViewController.tabBarItem = UITabBarItem(title: "Categories", image: UIImage(systemName: "rectangle.grid.1x2"), tag: 0)
        setupNavigationBarAppearance(navigationController: categoriesCoordinator.navigationController, navigationBarTitle: "Categories")
        return categoriesCoordinator.rootViewController
    }

    func setupSwipingViewController() -> UIViewController {
        let swipingCoordinator = SwipingCardNavigationCoordinator()
        startChildCoordinator(swipingCoordinator)
        swipingCoordinator.rootViewController.tabBarItem = UITabBarItem(title: "Random", image: UIImage(systemName: "arrow.2.squarepath"), tag: 1)
        setupNavigationBarAppearance(navigationController: swipingCoordinator.navigationController, navigationBarTitle: "Random")
        return swipingCoordinator.rootViewController
    }

    func setupProfileViewController() -> UIViewController {
        let profileCoordinator = ProfileNavigationCoordinator()
        startChildCoordinator(profileCoordinator)
        // let profileTabViewController = UINavigationController(rootViewController: UIHostingController(rootView: ProfileView()))
        profileCoordinator.rootViewController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.circle"), tag: 2)
        setupNavigationBarAppearance(navigationController: profileCoordinator.navigationController, navigationBarTitle: "Profile")
        return profileCoordinator.rootViewController
    }
}

extension MainTabBarCoordinator: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if viewController === tabBarController.viewControllers?.last {
            // rootViewController.showInfoAlert(title: "Something is wrong...")
        }
    }
}

extension UIViewController {
    func showInfoAlert(title: String, message: String? = nil, handler: (() -> Void)? = nil) {
        guard presentedViewController == nil else {
            return
        }

        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(
            title: "OK",
            style: .default
        ) { _ in
            handler?()
        }
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
}
