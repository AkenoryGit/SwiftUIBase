//
//  ContentView.swift
//  SwiftUIBase
//
//  Created by Дмитрий Дудник on 03.11.2025.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("showTitle") private var showTitle = true
    @AppStorage("rowHeight") private var rowHeight: Double = 80
    
    var body: some View {
        TabView {
            InfoView(showTitle: showTitle, rowHeight: rowHeight)
                .tabItem {
                    Label("Знания", systemImage: "book")
                }
            
            HelloView()
                .tabItem {
                    Label("Hello", systemImage: "hand.wave")
                }
            
            SettingsView()
                .tabItem {
                    Label("Настройки", systemImage: "gear")
                }
        }
        .accentColor(.blue)
    }
}

#Preview {
    ContentView()
}
