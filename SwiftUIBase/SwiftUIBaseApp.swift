//
//  SwiftUIBaseApp.swift
//  SwiftUIBase
//
//  Created by Дмитрий Дудник on 03.11.2025.
//

import SwiftUI

@main
struct SwiftUIBaseApp: App {
    @StateObject private var postStorage = PostStorage()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(postStorage)
        }
    }
}
