//
//  CustomNavigationController.swift
//  CourseApp
//
//  Created by Pavla Beránková on 28.05.2024.
//

import Combine
import os
import UIKit

class CustomNavigationController: UINavigationController {
    private let logger = Logger()
    private let eventSubject = PassthroughSubject<CustomNavigationControllerEvent, Never>()

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        interactivePopGestureRecognizer?.delegate = self
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if isBeingDismissed {
            eventSubject.send(.dismiss)
        }
    }
}

extension CustomNavigationController: EventEmitting {
    var eventPublisher: AnyPublisher<CustomNavigationControllerEvent, Never> {
        eventSubject.eraseToAnyPublisher()
    }
}


extension CustomNavigationController: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        logger.info("\(gestureRecognizer)")
        return true
    }
}

extension CustomNavigationController: UINavigationControllerDelegate {
    func navigationController(
        _ navigationController: UINavigationController,
        willShow viewController: UIViewController,
        animated _: Bool
    ) {
        logger.info("\(viewController)")}

    public func navigationController(
        _ navigationController: UINavigationController,
        didShow viewController: UIViewController,
        animated _: Bool
    ) {
        logger.info("\(viewController)")
    }
}
