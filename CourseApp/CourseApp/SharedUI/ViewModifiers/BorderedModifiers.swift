//
//  BorderedModifiers.swift
//  CourseApp
//
//  Created by Pavla Beránková on 19.05.2024.
//

import SwiftUI

struct BorderedModifiers: ViewModifier {
    var cornerRadius: CGFloat

    func body(content: Content) -> some View {
        content
            .background(.gray)
            .cornerRadius(cornerRadius)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(Color.white, lineWidth: 2)
            )
            .shadow(radius: 2)
    }
}

extension View {
    func bordered(cornerRadius: CGFloat) -> some View {
        self.modifier(BorderedModifiers(cornerRadius: cornerRadius))
    }
}
