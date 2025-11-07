//
//  PostStorage.swift
//  SwiftUIBase
//
//  Created by Дмитрий Дудник on 07.11.2025.
//

import Foundation
import SwiftUI
import Combine

class PostStorage: ObservableObject {
    @Published var posts: [Post] = samplePosts
    
    func addPost(_ post: Post) {
        posts.append(post)
    }
}
