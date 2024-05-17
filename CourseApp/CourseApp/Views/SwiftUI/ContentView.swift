//
//  ContentView.swift
//  CourseApp
//
//  Created by Pavla Beránková on 26.04.2024.
//

import os
import SwiftUI

struct ContentView: View {
    let jokesBaseURL = Configuration.default.jokesBaseURL
    let fontSize: CGFloat = 20
    private var logger = Logger()

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, Swift!")
                .font(.custom("Poppins-Bold", size: fontSize))
            Text("Hello, Swift!")
                .font(.custom("Poppins-MediumItalic", size: fontSize))
            Text("Hello, Swift!")
                .font(.custom("Poppins-Regular", size: fontSize))
        }
        .padding()
        .onAppear {
            logger.info("Joke base url: \(jokesBaseURL)")

            // Use this identifier to filter out the system fonts in the logs.
            let identifier: String = "[SYSTEM FONTS]"
            // Here is the functionality that prints all the system fonts.
            for family in UIFont.familyNames as [String] {
                debugPrint("\(identifier) FONT FAMILY: \(family)")
                for name in UIFont.fontNames(forFamilyName: family) {
                    debugPrint("\(identifier) --FONT NAME: \(name)")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
