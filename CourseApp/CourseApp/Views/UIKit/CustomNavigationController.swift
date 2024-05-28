////
////  CustomNavigationController.swift
////  CourseApp
////
////  Created by Pavla Beránková on 28.05.2024.
////
//
//import Combine
//import UIKit
//
//class CustomNavigationController: UINavigationController {
//    private let eventSubject = PassthroughSubject<CustomNavigationControllerEvent, Never>()
//
//    // MARK: Lifecycle
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupNavigationBarAppearance()
//        delegate = self
//        interactivePopGestureRecognizer?.delegate = self
//    }
//
//    override func viewDidDisappear(_ animated: Bool) {
//        super.viewDidDisappear(animated)
//        if isBeingDismissed {
//            eventSubject.send(.dismiss)
//        }
//    }
//}
//
//// MARK:
//extension CustomNavigationController: EventEmitting {
//    var eventPublisher: AnyPublisher<CustomNavigationControllerEvent, Never> {
//        eventSubject.eraseToAnyPublisher()
//    }
//}
//
//
//extension CustomNavigationController: UIGestureRecognizerDelegate {
//    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
//        print(gestureRecognizer)
//        return true
//    }
//}
//
//extension CustomNavigationController: UINavigationControllerDelegate {
//    func navigationController(
//        _ navigationController: UINavigationController,
//        willShow viewController: UIViewController,
//        animated _: Bool
//    ) {
//        print(viewController)
//
//    }
//
//    public func navigationController(
//        _ navigationController: UINavigationController,
//        didShow viewController: UIViewController,
//        animated _: Bool
//    ) {
//        print(viewController)
//    }
//}
