//
//  OnboardingView.swift
//  CourseApp
//
//  Created by Pavla Beránková on 27.05.2024.
//

import SwiftUI

struct OnboardingView: View {
    @State private var path = NavigationPath()
    let totalScreens = 4

    var body: some View {
        NavigationStack(path: $path) {
            OnboardingDetailView(screenNumber: 0, totalScreen: totalScreens, path: $path)
                .navigationTitle("Onboarding")
                .navigationBarTitleDisplayMode(.inline)
                .navigationDestination(for: Int.self) { number in
                    OnboardingDetailView(screenNumber: number, totalScreen: totalScreens, path: $path)
                }
        }
        .darkBackgroundColor()
    }
}

#Preview {
    OnboardingView()
}
