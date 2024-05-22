//
//  BackgroundColorModifier.swift
//  CourseApp
//
//  Created by Pavla Beránková on 22.05.2024.
//

import SwiftUI

struct BackgroundColorModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(.bg)
    }
}

extension View {
    func darkBackgroundColor() -> some View {
        self.modifier(BackgroundColorModifier())
    }
}
