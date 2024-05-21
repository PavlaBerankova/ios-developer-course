//
//  MainTabView+Helper.swift
//  CourseApp
//
//  Created by Pavla Beránková on 20.05.2024.
//

import SwiftUI

struct MainTabView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> MainTabBarController {
       MainTabBarController()
    }

    func updateUIViewController(_ uiViewController: MainTabBarController, context: Context) { }
}
