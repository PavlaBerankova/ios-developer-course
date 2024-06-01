//
//  OnboardingNavigationCoordinator.swift
//  CourseApp
//
//  Created by Pavla Beránková on 28.05.2024.
//

import Combine
import os
import SwiftUI
import UIKit

protocol OnboardingCoordinating: NavigationControllerCoordinator { }

final class OnboardingNavigationCoordinator: OnboardingCoordinating {
    private let logger = Logger()
    private enum Page: Int, CaseIterable {
        case welcome
        case services
        case letstart

        var title: String {
            switch self {
            case .letstart: 
                "Lets Start"
            case .services: 
                "Services"
            case .welcome: 
                "Welcome"
            }
        }
    }

    deinit {
        logger.info("Deinit OnboardingNavigationCoordinator")
    }

    private(set) lazy var navigationController: UINavigationController = makeNavigationController()
    private var cancellables = Set<AnyCancellable>()
    private let eventSubject = PassthroughSubject<OnboardingNavigationCoordinatorEvent, Never>()
    var childCoordinators: [any Coordinator] = []
}

// MARK: - Start coordinator
extension OnboardingNavigationCoordinator {
    func start() {
        navigationController.setViewControllers(
            [makeOnboardingView(page: Page.welcome)],
            animated: false
        )
    }
}

// MARK: - Factory methods
private extension OnboardingNavigationCoordinator {
    func makeNavigationController() -> UINavigationController {
        let navigationController = CustomNavigationController()
        navigationController.eventPublisher.sink { [weak self] _ in
            guard let self else {
                return
            }
            self.eventSubject.send(.dismiss(self))
        }
        .store(in: &cancellables)
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.modalTransitionStyle = .crossDissolve
        return navigationController
    }

    private func makeOnboardingView(page: Page) -> UIViewController {
        let onboardingView = OnboardingView(page: page.rawValue, title: page.title)
        onboardingView.eventPublisher.sink { [weak self] event in
            guard let self else {
                return
            }

            switch event {
            case .close:
                self.navigationController.dismiss(animated: true)

            case let .nextPage(from):
                var newPage: Page
                if from < Page.allCases.count - 1 {
                    // swiftlint:disable:next force_unwrapping
                    newPage = Page(rawValue: from + 1)!
                } else {
                    newPage = Page.welcome
                }
                let viewController = self.makeOnboardingView(page: newPage)
                self.navigationController.pushViewController(viewController, animated: true)
            }
        }
        .store(in: &cancellables)

        return UIHostingController(rootView: onboardingView)
    }
}
