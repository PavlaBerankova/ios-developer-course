//
//  SwipingView.swift
//  CourseApp
//
//  Created by Pavla Beránková on 19.05.2024.
//

import SwiftUI

// swiftlint:disable disable_print
struct SwipingView: View {
    let dataProvider = MockDataProvider()
    private let paddingTopRatio: CGFloat = 20
    private let frameWidthRatio: CGFloat = 1.2
    private let frameHeightRatio: CGFloat = 1.5

    var body: some View {
        GeometryReader { geometry in
            HStack {
                Spacer()

                VStack {
                    if !dataProvider.data.isEmpty, let jokes = dataProvider.data.first?.jokes {
                        ZStack {
                            ForEach(jokes, id: \.self) { joke in
                                SwipingCard(
                                    configuration: SwipingCard.Configuration(
                                        image: Image(uiImage: joke.image ?? UIImage()),
                                        title: "Category",
                                        description: joke.text
                                    ),
                                    swipeStateAction: { print($0) }
                                )
                            }
                        }
                        .padding(.top, geometry.size.height / paddingTopRatio)
                        .frame(width: geometry.size.width / frameWidthRatio, height: (geometry.size.width / frameWidthRatio) * frameHeightRatio)
                    } else {
                        Text("Empty data!")
                    }

                    Spacer()
                }

                Spacer()
            }
        }
        .darkBackgroundColor()
    }
}
// swiftlint:enable disable_print

#Preview {
    SwipingView()
}
