//
//  AppDelegate.swift
//  CourseApp
//
//  Created by Pavla Beránková on 09.05.2024.
//
import Firebase
import SwiftUI

enum Deeplink {
    case onboarding(page: Int)
    case closeOnboarding
    case signIn
}

final class AppDelegate: NSObject, UIApplicationDelegate {
    let appCoordinator: some AppCoordinating = {
        let coordinator = AppCoordinator()
        coordinator.start()
        return coordinator
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        FirebaseApp.configure()
        deeplinkFromService()

        return true
    }

    func deeplinkFromService() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            self?.appCoordinator.handleDeeplink(deeplink: .onboarding(page: 2))
        }
    }
}
