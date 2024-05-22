//
//  DesignSystem.swift
//  CourseApp
//
//  Created by Pavla Beránková on 21.05.2024.
//

import SwiftUI
import UIKit

enum FontSize: CGFloat {
    case size36 = 36
    case size28 = 28
    case size20 = 20
    case size12 = 12
}

enum FontType: String {
    case regular = "Poppins-Regular"
    case bold = "Poppins-Bold"
    case mediumItalic = "Poppins-MediumItalic"
}

extension UIFont {
    static func regular(with size: FontSize) -> UIFont {
        UIFont(name: FontType.regular.rawValue, size: size.rawValue)!
    }

    static func bold(with size: FontSize) -> UIFont {
        UIFont(name: FontType.bold.rawValue, size: size.rawValue)!
    }

    static func mediumItalic(with size: FontSize) -> UIFont {
        UIFont(name: FontType.mediumItalic.rawValue, size: size.rawValue)!
    }
}

extension Font {
    static func regular(with size: FontSize) -> Font {
        Font.custom(FontType.regular.rawValue, size: size.rawValue)
    }

    static func bold(with size: FontSize) -> Font {
        Font.custom(FontType.bold.rawValue, size: size.rawValue)
    }

    static func mediumItalic(with size: FontSize) -> Font {
        Font.custom(FontType.mediumItalic.rawValue, size: size.rawValue)
    }
}

enum TextType {
    case h1Title
    case h2Title
    case h3Title
    case navTitle

    var font: Font {
        switch self {
        case .h1Title: .bold(with: .size28)
        case .h2Title: .regular(with: .size20)
        case.h3Title: .mediumItalic(with: .size12)
        default: .regular(with: .size12)
        }
    }

    var uiFont: UIFont {
        switch self {
        case .h1Title: .bold(with: .size28)
        case .h2Title: .regular(with: .size20)
        case .h3Title: .mediumItalic(with: .size12)
        default: .regular(with: .size12)
        }
    }

    var color: Color {
        switch self {
        case .h1Title, .h2Title, .h3Title: .white
        case .navTitle: .black
        }
    }

    var uiColor: UIColor {
        switch self {
        case .h1Title, .h2Title, .h3Title: .white
        case .navTitle: .black
        }
    }
}
