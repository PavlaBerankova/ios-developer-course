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
        seteupGlobalTabBarUI()
        // setupTabBar()
        setupTabBarController()
    }
}

// MARK: - UI Setup
private extension MainTabBarController {
    //    func setupTabBar() {
    //        tabBar.backgroundImage = UIImage()
    //        tabBar.shadowImage = UIImage()
    //        tabBar.backgroundColor = .red
    //        tabBar.tintColor = .blue
    //    }

    func seteupGlobalTabBarUI() {
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
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]

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

        return swipingNavigationController
    }
}
