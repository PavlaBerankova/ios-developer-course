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
    private var logger = Logger()

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            logger.info("Joke base url: \(jokesBaseURL)")
        }
    }
}

#Preview {
    ContentView()
}
