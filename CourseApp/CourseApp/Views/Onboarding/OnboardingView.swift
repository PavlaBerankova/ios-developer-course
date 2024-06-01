//
//  OnboardingView.swift
//  CourseApp
//
//  Created by Pavla Beránková on 27.05.2024.
//

import Combine
import os
import SwiftUI

struct OnboardingView: View {
    let page: Int
    let title: String
    private let logger = Logger()
    private let eventSubject = PassthroughSubject<OnboardingViewEvent, Never>()

    init(page: Int, title: String) {
        self.page = page
        self.title = title
    }

    var body: some View {
        VStack {
            Text("This is page \(title)")
            Button {
                eventSubject.send(.nextPage(from: page))
                logger.info("Onboarding button on page tapped \(page)")
            } label: {
                Text("Next")
                    .bold()
                    .padding()
                    .foregroundColor(.main)
                    .background(.black)
                    .bordered(cornerRadius: 10)
            }

            Button {
                eventSubject.send(.close)
                logger.info("Onboarding button close tapped")
            } label: {
                Text("Close")
                    .bold()
                    .padding()
                    .foregroundColor(.main)
                    .background(.red)
                    .bordered(cornerRadius: 10)
            }
        }
        .darkBackgroundColor()
    }
}

extension OnboardingView: EventEmitting {
    var eventPublisher: AnyPublisher<OnboardingViewEvent, Never> {
        eventSubject.eraseToAnyPublisher()
    }
}

#Preview {
    OnboardingView(page: 1, title: "Welcome")
}
