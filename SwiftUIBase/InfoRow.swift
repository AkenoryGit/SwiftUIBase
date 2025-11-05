//
//  InfoRow..swift
//  SwiftUIBase
//
//  Created by Дмитрий Дудник on 03.11.2025.
//

import SwiftUI

struct InfoRow: View {
    let post: Post
    let height: Double
    
    var body: some View {
        HStack {
            post.image
                .resizable()
                .frame(width: height * 0.6, height: height * 0.6)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            
            VStack(alignment: .leading) {
                Text(post.title)
                    .font(.headline)
                Text(post.description)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
            }
            .padding(.leading, 8)
        }
        .frame(height: height)
    }
}

#Preview {
    InfoRow(post: samplePosts[0], height: 80)
}
