//
//  InfoRow..swift
//  SwiftUIBase
//
//  Created by Дмитрий Дудник on 03.11.2025.
//

import SwiftUI

struct InfoRow: View {
    let post: Post
    
    var body: some View {
        HStack {
            post.image
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            
            VStack(alignment: .leading) {
                Text(post.title)
                    .font(.headline)
                Text(post.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
            }
            .padding(.leading, 8)
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    InfoRow(post: samplePosts[0])
}
