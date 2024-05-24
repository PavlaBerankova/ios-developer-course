//  CourseApp
//
//  Created by Pavla Beránková on 26.04.2024.
//

import FirebaseCore
import os
import SwiftUI

@main
struct CourseApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    private let logger = Logger()
    private let tabBarCoordinator = {
        let coordinator = MainTabBarCoordinator()
        coordinator.start()
        return coordinator
    }()

    var body: some Scene {
        WindowGroup {
            CoordinatorView(coordintator: tabBarCoordinator)
                .ignoresSafeArea(edges: .all)
                .onAppear {
                    logger.info("Content view has appeared")
                }
        }
    }
}
