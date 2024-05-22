//
//  Color.swift
//  CourseApp
//
//  Created by Pavla Beránková on 22.05.2024.
//

import SwiftUI

extension Color {
    static let theme = ColorTheme()
}

struct ColorTheme {
    let accent = Color("AccentColor")
    let textWhite = Color.white
    let backgroundColor = Color(.bg)
}

extension UIColor {
    static let uiTheme = UIColorTheme()
}

struct UIColorTheme {
    let accent = UIColor(named: "AccentColor")
    let navBarText = UIColor.black
    let labelColor = UIColor.white
}
