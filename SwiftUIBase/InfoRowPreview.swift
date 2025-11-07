//
//  InfoRowPreview.swift
//  SwiftUIBase
//
//  Created by Дмитрий Дудник on 06.11.2025.
//

import SwiftUI

struct InfoRowPreview: View {
    let height: Double
    
    var body: some View {
        InfoRow(post: samplePosts[0], height: height)
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(12)
    }
}

#Preview {
    InfoRowPreview(height: 80)
}
