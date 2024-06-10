//
//  ProfileView.swift
//  CourseApp
//
//  Created by Pavla Beránková on 27.05.2024.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack {
            Color(.bg)
                .ignoresSafeArea()
            VStack {
                Text("Profile")
                    .foregroundStyle(.white)
            }
        }
    }
}

#Preview {
    ProfileView()
}
