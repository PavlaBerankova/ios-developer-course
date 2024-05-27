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
        appearance.backgroundColor = .accent
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
        let categoriesTabViewController = UINavigationController(rootViewController: HomeViewController())
        categoriesTabViewController.tabBarItem = UITabBarItem(title: "Categories", image: UIImage(systemName: "rectangle.grid.1x2"), tag: 0)
        setupNavigationBarAppearance(navigationController: categoriesTabViewController, navigationBarTitle: "Categories")
        return categoriesTabViewController
    }

    func setupSwipingViewController() -> UIViewController {
        let swipingTabViewController = UINavigationController(rootViewController: UIHostingController(rootView: SwipingView()))
        swipingTabViewController.tabBarItem = UITabBarItem(title: "Random", image: UIImage(systemName: "arrow.2.squarepath"), tag: 1)
        setupNavigationBarAppearance(navigationController: swipingTabViewController, navigationBarTitle: "Random")
        return swipingTabViewController
    }

    func setupProfileViewController() -> UIViewController {
        let profileTabViewController = UINavigationController(rootViewController: UIHostingController(rootView: ProfileView()))
        profileTabViewController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.circle"), tag: 2)
        setupNavigationBarAppearance(navigationController: profileTabViewController, navigationBarTitle: "Profile")
        return profileTabViewController
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
