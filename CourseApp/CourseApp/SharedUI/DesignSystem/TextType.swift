//
//  TextType.swift
//  CourseApp
//
//  Created by Pavla Beránková on 22.05.2024.
//

import SwiftUI
import UIKit

enum TextType {
    case h1Title
    case h2Title
    case h3Title
    case navTitle

    var font: Font {
        switch self {
        case .h1Title:
            return .bold(with: .size28)
        case .h2Title:
            return .regular(with: .size20)
        case.h3Title:
            return .mediumItalic(with: .size12)
        default:
            return .regular(with: .size12)
        }
    }

    var uiFont: UIFont {
        switch self {
        case .h1Title:
            return .bold(with: .size28)
        case .h2Title:
            return .regular(with: .size20)
        case .h3Title:
            return .mediumItalic(with: .size12)
        default:
            return .regular(with: .size12)
        }
    }

    var color: Color {
        switch self {
        case .h1Title, .h2Title, .h3Title:
            return .white
        case .navTitle:
            return .black
        }
    }

    var uiColor: UIColor {
        switch self {
        case .h1Title, .h2Title, .h3Title:
            return .white
        case .navTitle:
            return .black
        }
    }
}
