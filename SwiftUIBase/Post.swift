//
//  Post.swift
//  SwiftUIBase
//
//  Created by Дмитрий Дудник on 03.11.2025.
//

import SwiftUI

struct Post: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let image: Image
}


