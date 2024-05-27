//
//  OnboardingDetailView.swift
//  CourseApp
//
//  Created by Pavla Beránková on 27.05.2024.
//

import SwiftUI

struct OnboardingDetailView: View {
    let screenNumber: Int
    let totalScreen: Int
    @Binding var path: NavigationPath

    var body: some View {
        VStack {
            Text(screenNumber == 0 ? "Onboarding" : "Screen number: \(screenNumber) of \(totalScreen)")
                .font(.largeTitle)
                .foregroundStyle(.black)
            Button {
                if screenNumber >= totalScreen {
                    path = NavigationPath()
                    // dismiss sheet
                } else {
                    path.append(screenNumber)
                }
            } label: {
                if screenNumber == 0 {
                    Text("Start")
                } else if screenNumber >= totalScreen {
                    Text("End Onboarding")
                } else {
                    Text("Next Screen")
                }
            }
            .bold()
            .padding()
            .background(.black)
            .cornerRadius(10)
        }
        .navigationDestination(for: Int.self) { number in
            OnboardingDetailView(screenNumber: number + 1, totalScreen: totalScreen, path: $path)
        }
    }
}

#Preview {
    OnboardingDetailView(screenNumber: 0, totalScreen: 4, path: .constant(NavigationPath()))
}
