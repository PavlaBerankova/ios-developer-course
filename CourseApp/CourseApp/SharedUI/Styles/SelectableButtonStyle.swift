//
//  SelectableButtonStyle.swift
//  CourseApp
//
//  Created by Pavla Beránková on 19.05.2024.
//

import SwiftUI

struct SelectableButtonStyle: ButtonStyle {
    @Binding var isSelected: Bool
    var color: Color
    private let padding: CGFloat = 10
    private let opacity: CGFloat = 0.5
    private let cornerRadius: CGFloat = 8
    private let pressedScale: CGFloat = 0.8
    private let defaultScale: CGFloat = 1.0

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(padding)
            .background(color.opacity(opacity))
            .foregroundColor(isSelected ? .red : .white)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            .scaleEffect(configuration.isPressed ? pressedScale : defaultScale)
            .animation(.easeInOut, value: isSelected)
            .animation(.easeInOut, value: configuration.isPressed)
            .contentShape(Rectangle())
    }
}
