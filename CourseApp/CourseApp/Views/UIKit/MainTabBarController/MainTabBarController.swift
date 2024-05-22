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
        viewControllers = [setupCategoriesView(), setupSwipingView()]
    }

    func setupCategoriesView() -> UIViewController {
        let categoriesNavigationController = UINavigationController(rootViewController: HomeViewController())
        categoriesNavigationController.tabBarItem = UITabBarItem(
            title: "Categories",
            image: UIImage(systemName: "rectangle.grid.1x2"),
            tag: 0
        )

        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .accent
        appearance.shadowImage = UIImage()
        appearance.titleTextAttributes = [.foregroundColor: UIColor.uiTheme.navBarText]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.uiTheme.navBarText]

        categoriesNavigationController.navigationBar.standardAppearance = appearance
        categoriesNavigationController.navigationBar.compactAppearance = appearance
        categoriesNavigationController.navigationBar.scrollEdgeAppearance = appearance

        return categoriesNavigationController
    }

    func setupSwipingView() -> UIViewController {
        let swipingNavigationController = UINavigationController(rootViewController: UIHostingController(rootView: SwipingView()))
        swipingNavigationController.tabBarItem = UITabBarItem(
            title: "Random",
            image: UIImage(systemName: "arrow.2.squarepath"),
            tag: 1
        )


        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .accent
        appearance.shadowImage = UIImage()
        appearance.titleTextAttributes = [.foregroundColor: UIColor.uiTheme.navBarText]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.uiTheme.navBarText]

        swipingNavigationController.navigationBar.standardAppearance = appearance
        swipingNavigationController.navigationBar.compactAppearance = appearance
        swipingNavigationController.navigationBar.scrollEdgeAppearance = appearance

        return swipingNavigationController
    }
}
