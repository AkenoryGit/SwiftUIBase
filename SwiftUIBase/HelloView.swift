//
//  HelloView.swift
//  SwiftUIBase
//
//  Created by Дмитрий Дудник on 03.11.2025.
//

import SwiftUI

struct HelloView: View {
    var body: some View {
        VStack {
            Image(systemName: "hand.wave.fill")
                .font(.system(size: 60))
                .foregroundColor(.blue)
            
            Text("Hello world")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            Text("Это вторая вкладка")
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemBackground))
    }
}

#Preview {
    HelloView()
}
