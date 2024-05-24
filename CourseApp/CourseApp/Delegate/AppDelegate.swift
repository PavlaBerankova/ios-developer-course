//
//  AppDelegate.swift
//  CourseApp
//
//  Created by Pavla Beránková on 09.05.2024.
//
import Firebase
import SwiftUI

final class AppDelegate: NSObject, UIApplicationDelegate {
    let appCoordinator: some AppCoordinating = {
        let coordinator = AppCoordinator()
        coordinator.start()
        return coordinator
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        FirebaseApp.configure()

        return true
    }
}
