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
    private var logger = Logger()

    var body: some Scene {
        WindowGroup {
            MainTabView()
                .ignoresSafeArea(edges: .all)
                .onAppear {
                    logger.info("Content view has appeared")
                }
        }
    }
}
