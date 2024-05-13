//  CourseApp
//
//  Created by Pavla Beránková on 26.04.2024.
//

import FirebaseCore
import SwiftUI

@main
struct CourseApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }
    }
}
