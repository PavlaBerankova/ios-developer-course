//
//  HomeViewSwiftUI.swift
//  CourseApp
//
//  Created by Pavla Beránková on 18.05.2024.
//

import SwiftUI

struct HomeViewSwiftUI: View {
    @StateObject var dataProvider = MockDataProvider()

    var body: some View {
        #if DEBUG
        Self._printChanges()
        #endif

        return List {
            ForEach(dataProvider.data, id: \.self) { section in
                Section {
                    VStack {
                        ForEach(section.jokes) { joke in
                            ZStack(alignment: .bottomLeading) {
                                Image(uiImage: joke.image ?? UIImage())
                                    .resizableBordered(cornerRadius: 10)
                                    .onTapGesture {
                                        print("Tapped joke \(joke)")
                                    }
                                imagePanel
                            }
                        }
                    }
                    .background(.bg)
                    .padding([.leading, .trailing], 5)
                } header: {
                    Text(section.title)
                        .foregroundColor(.white)
                        .padding([.leading, .trailing], 5)
                }
                .background(.bg)
                .listRowInsets(EdgeInsets())
            }
        }
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
        .darkBackgroundColor()
    }

    private var imagePanel: some View {
        HStack {
            Text("Text")
                .foregroundStyle(.white)

            Spacer()

            Button {
                print("Tapped button")
            } label: {
                Image(systemName: "heart")
                    .foregroundColor(.white)
            }
            .buttonStyle(SelectableButtonStyle(isSelected: .constant(true), color: .gray))
        }
        .padding(5)
    }
}

#Preview {
    HomeViewSwiftUI()
}
