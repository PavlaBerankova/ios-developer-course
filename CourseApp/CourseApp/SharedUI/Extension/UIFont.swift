//
//  UIFont.swift
//  CourseApp
//
//  Created by Pavla Beránková on 22.05.2024.
//

import UIKit

extension UIFont {
    static func regular(with size: FontSize) -> UIFont {
        UIFont(name: FontType.regular.rawValue, size: size.rawValue) ?? UIFont()
    }

    static func bold(with size: FontSize) -> UIFont {
        UIFont(name: FontType.bold.rawValue, size: size.rawValue) ?? UIFont()
    }

    static func mediumItalic(with size: FontSize) -> UIFont {
        UIFont(name: FontType.mediumItalic.rawValue, size: size.rawValue) ?? UIFont()
    }
}
