//
//  MainTabBarCoordinator.swift
//  CourseApp
//
//  Created by Pavla Beránková on 24.05.2024.
//

import Combine
import SwiftUI
import UIKit

final class MainTabBarCoordinator: NSObject, TabBarControllerCoordinator {
    var childCoordinators = [Coordinator]()
    private(set) lazy var tabBarController = makeTabBarController()
    private lazy var cancellables = Set<AnyCancellable>()
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

    func handleDeeplink(deeplink: Deeplink) {
        switch deeplink {
        case let .onboarding(page):
            let coordinator = makeOnboardingFlow()
            startChildCoordinator(coordinator)
            tabBarController.present(coordinator.rootViewController, animated: true)
        default:
            break
        }
    }
}

// MARK: - Factory method
private extension MainTabBarCoordinator {
    func makeOnboardingFlow() -> ViewControllerCoordinator {
        let coordinator = OnboardingNavigationCoordinator()
//        coordinator.eventPublisher
//            .sink { [weak self] event in
//                self?.handle(event: event)
//            }
//            .store(in: &cancellables)
        return coordinator
    }

    func setupNavigationBarAppearance(_ navigationController: UINavigationController, title: String) {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor.main
        appearance.shadowImage = UIImage()
        appearance.titleTextAttributes = [.foregroundColor: TextType.navTitle.uiColor]
        appearance.largeTitleTextAttributes = [.foregroundColor: TextType.navTitle.uiColor]

        navigationController.topViewController?.title = title
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
        categoriesCoordinator.rootViewController.tabBarItem = UITabBarItem(
            title: "Categories",
            image: UIImage(systemName: "rectangle.grid.1x2"),
            tag: 0
        )
        setupNavigationBarAppearance(categoriesCoordinator.navigationController, title: "Categories")
        return categoriesCoordinator.rootViewController
    }

    func setupSwipingViewController() -> UIViewController {
        let swipingCoordinator = SwipingCardNavigationCoordinator()
        startChildCoordinator(swipingCoordinator)
        swipingCoordinator.rootViewController.tabBarItem = UITabBarItem(
            title: "Random",
            image: UIImage(systemName: "arrow.2.squarepath"),
            tag: 1
        )
        setupNavigationBarAppearance(swipingCoordinator.navigationController, title: "Random")
        return swipingCoordinator.rootViewController
    }

    func setupProfileViewController() -> UIViewController {
        let profileCoordinator = ProfileNavigationCoordinator()
        startChildCoordinator(profileCoordinator)
        profileCoordinator.rootViewController.tabBarItem = UITabBarItem(
            title: "Profile",
            image: UIImage(systemName: "person.circle"),
            tag: 2
        )
        setupNavigationBarAppearance(profileCoordinator.navigationController, title: "Profile")
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
