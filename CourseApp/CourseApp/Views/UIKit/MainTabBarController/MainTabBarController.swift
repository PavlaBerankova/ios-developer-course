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
        UITabBar.appearance().backgroundColor = .purple
        UITabBar.appearance().tintColor = .white
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
        appearance.backgroundColor = .purple
        appearance.shadowImage = UIImage()

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
