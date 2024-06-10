//
//  BorderedModifiers.swift
//  CourseApp
//
//  Created by Pavla Beránková on 19.05.2024.
//

import SwiftUI

struct BorderedModifiers: ViewModifier {
    var cornerRadius: CGFloat
    private let lineWidth: CGFloat = 2
    private let radius: CGFloat = 2

    func body(content: Content) -> some View {
        content
            .background(.gray)
            .cornerRadius(cornerRadius)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(.accent, lineWidth: lineWidth)
            )
            .shadow(radius: radius)
    }
}

extension View {
    func bordered(cornerRadius: CGFloat) -> some View {
        self.modifier(BorderedModifiers(cornerRadius: cornerRadius))
    }
}
