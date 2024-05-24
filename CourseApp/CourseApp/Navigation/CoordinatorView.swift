//
//  CoordinatorView.swift
//  CourseApp
//
//  Created by Pavla Beránková on 24.05.2024.
//

import UIKit
import SwiftUI

// MARK: UIViewControllerRepresentable
struct CoordinatorView<T: ViewControllerCoordinator>: UIViewControllerRepresentable {
    let coordinator: T

    func makeUIViewController(context: Context) -> UIViewController {
        coordinator.rootViewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) { }
}
