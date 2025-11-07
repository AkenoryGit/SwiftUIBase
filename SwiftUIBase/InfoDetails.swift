//
//  InfoDetails.swift
//  SwiftUIBase
//
//  Created by Дмитрий Дудник on 03.11.2025.
//

import SwiftUI

struct InfoDetails: View {
    let post: Post
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                post.image
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(post.title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text(post.description)
                        .font(.body)
                        .foregroundColor(.secondary)
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .padding(.top)
        }
        .navigationTitle(post.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    InfoDetails(post: samplePosts[0])
}
