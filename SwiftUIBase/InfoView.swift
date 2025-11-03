//
//  InfoView.swift
//  SwiftUIBase
//
//  Created by Дмитрий Дудник on 03.11.2025.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        NavigationView {
            List(samplePosts) { post in
                NavigationLink {
                    InfoDetails(post: post)
                } label: {
                    InfoRow(post: post)
                }
            }
            .navigationTitle("База знаний")
        }
    }
}

#Preview {
    InfoView()
}
