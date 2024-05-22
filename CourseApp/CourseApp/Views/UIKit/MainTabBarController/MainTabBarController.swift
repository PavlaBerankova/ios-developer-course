//
//  MainTabBarController.swift
//  CourseApp
//
//  Created by Pavla Beránková on 20.05.2024.
//

import SwiftUI
import UIKit

final class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGlobalTabBarUI()
        setupTabBarController()
    }
}

// MARK: - UI Setup
private extension MainTabBarController {
    func setupGlobalTabBarUI() {
        let tabBarAppearance = UITabBarAppearance()
        UITabBar.appearance().backgroundColor = .accent

        tabBarAppearance.stackedLayoutAppearance.normal.iconColor = UIColor.gray
        tabBarAppearance.stackedLayoutAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.gray]

        tabBarAppearance.stackedLayoutAppearance.selected.iconColor = UIColor.black
        tabBarAppearance.stackedLayoutAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]

        tabBar.standardAppearance = tabBarAppearance
    }

    func setupTabBarController() {
        viewControllers = [
            setupViewController(
                rootViewController: HomeViewController(),
                title: "Categories",
                imageName: "rectangle.grid.1x2",
                tag: 0
            ),
            setupViewController(
                rootViewController: UIHostingController(rootView: SwipingView()),
                title: "Random",
                imageName: "arrow.2.squarepath",
                tag: 1
            )
        ]
    }

    func setupViewController(rootViewController: UIViewController, title: String, imageName: String, tag: Int) -> UIViewController {
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.tabBarItem = UITabBarItem(
            title: title,
            image: UIImage(systemName: imageName),
            tag: tag
        )

        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .accent
        appearance.shadowImage = UIImage()
        appearance.titleTextAttributes = [.foregroundColor: TextType.navTitle.uiColor]
        appearance.largeTitleTextAttributes = [.foregroundColor: TextType.navTitle.uiColor]

        navigationController.navigationBar.standardAppearance = appearance
        navigationController.navigationBar.compactAppearance = appearance
        navigationController.navigationBar.scrollEdgeAppearance = appearance
        navigationController.topViewController?.title = title

        return navigationController
    }
}
