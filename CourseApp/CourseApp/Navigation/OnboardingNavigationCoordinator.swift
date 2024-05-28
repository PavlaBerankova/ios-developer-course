//
//  OnboardingNavigationCoordinator.swift
//  CourseApp
//
//  Created by Pavla Beránková on 28.05.2024.
//

import os
import SwiftUI
import UIKit

protocol OnboardingCoordinating: NavigationControllerCoordinator { }

final class OnboardingNavigationCoordinator: OnboardingCoordinating {
    let logger = Logger()

    deinit {
        logger.info("Deinit OnboardingNavigationCoordinator")
    }

    private(set) lazy var navigationController: UINavigationController = makeNavigationController()
//    private var cancellables = Set<AnyCancellable>()
//    private let eventSubject = PassthroughSubject<OnboardingNavigationEvent, Never>()
    var childCoordinators: [any Coordinator] = []
}

extension OnboardingNavigationCoordinator {
    func makeNavigationController() -> UINavigationController {
        let navigationController = UINavigationController()
//        navigationController.eventPublisher.sink { [weak self] _ in
//                   guard let self else {
//                       return
//                   }
//                   self.eventSubject.send(.dismiss(self))
//               }
//               .store(in: &cancellables)
//               navigationController.modalPresentationStyle = .fullScreen
//               navigationController.modalTransitionStyle = .crossDissolve
        return navigationController
    }

    func start() {
        navigationController.setViewControllers(
            [makeOnboardingView(), makeOnboardingView(), makeOnboardingView()],
            animated: false
        )
    }
}

extension OnboardingCoordinating {
    func makeOnboardingView() -> UIViewController {
        let controller = UIHostingController(rootView: OnboardingView())

        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .crossDissolve

        return controller
    }
}
