//
//  SwipingCardView.swift
//  CourseApp
//
//  Created by Pavla Beránková on 19.05.2024.
//

import SwiftUI

typealias Action<T> = (T) -> Void

struct SwipingCard: View {
    // MARK: - SwipeDirection
    enum SwipeDirection {
        case left, right
    }

    // MARK: - SwipeState
    enum SwipeState {
        case swiping(direction: SwipeDirection)
        case finished(direction: SwipeDirection)
        case cancelled
    }

    // MARK: - Configuration
    struct Configuration: Equatable {
        let image: Image
        let title: String
        let description: String

        public init(
            image: Image,
            title: String,
            description: String
        ) {
            self.image = image
            self.title = title
            self.description = description
        }
    }

    private let swipingAction: Action<SwipeState>
    private let configuration: Configuration

    @State private var offset: CGSize = .zero
    @State private var color: Color = .black.opacity(0.7)

    init(configuration: Configuration,
         swipeStateAction: @escaping (Action<SwipeState>)) {
        self.configuration = configuration
        self.swipingAction = swipeStateAction
    }

    // MARK: - View
    var body: some View {
        HStack {
            Spacer()

            VStack {
                Spacer()
                // scratch view
                Spacer()
                cardDescription
            }

            Spacer()
        }
        .background(color)
        .cornerRadius(15)
    }

    private var cardDescription: some View {
        Text(configuration.title)
            .foregroundStyle(.white)
            .fontWeight(.bold)
            .padding(10)
            .background(Color.black.opacity(0.5))
            .cornerRadius(10)
            .padding()
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        SwipingCard(
            configuration: SwipingCard.Configuration(
                image: Image("nature"),
                title: "Card Title",
                description: "This is a short description. This is a short description. This is a short descrtiption. This is a short description"),
            swipeStateAction: { _ in }
        )
        .previewLayout(.sizeThatFits)
        .frame(width: 220, height: 340)
    }
}
