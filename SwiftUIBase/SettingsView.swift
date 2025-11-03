//
//  SettingsView.swift
//  SwiftUIBase
//
//  Created by Дмитрий Дудник on 03.11.2025.
//

import SwiftUI

struct SettingsView: View {
    @State private var isNotificationsEnabled = true
    @State private var selectedTheme = 0
    @State private var volumeLevel: Double = 0.7
    
    var body: some View {
        NavigationView {
            Form {
                Section("Уведомления") {
                    Toggle("Включить уведомления", isOn: $isNotificationsEnabled)
                }
                
                Section("Внешний вид") {
                    Picker("Тема", selection: $selectedTheme) {
                        Text("Светлая").tag(0)
                        Text("Тёмная").tag(1)
                        Text("Авто").tag(2)
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Звук") {
                    HStack {
                        Text("Громкость")
                        Slider(value: $volumeLevel, in: 0...1)
                            .accentColor(.blue)
                        Text("\(Int(volumeLevel * 100))%")
                    }
                }
                
                Section {
                    Button("Сбросить настройки") {
                        isNotificationsEnabled = true
                        selectedTheme = 0
                        volumeLevel = 0.7
                    }
                    .foregroundColor(.red)
                }
            }
            .navigationTitle("Настройки")
        }
    }
}

#Preview {
    SettingsView()
}
