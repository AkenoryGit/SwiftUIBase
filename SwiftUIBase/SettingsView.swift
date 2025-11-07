//
//  SettingsView.swift
//  SwiftUIBase
//
//  Created by Дмитрий Дудник on 03.11.2025.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("showTitle") private var showTitle = true
    @AppStorage("rowHeight") private var rowHeight: Double = 80
    @AppStorage("selectedTheme") private var selectedTheme = 2
    
    @State private var isEditing = false
    @State private var isNotificationsEnabled = true
    @State private var volumeLevel: Double = 0.7
    
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        NavigationView {
            Form {
                Section("Уведомления") {
                    Toggle("Включить уведомления", isOn: $isNotificationsEnabled)
                    
                    Text(selectedTheme == 1 ? "Dark Theme enabled" : "Light Theme enabled")
                        .font(.headline)
                }
                
                Picker("Тема", selection: .constant(colorScheme == .dark ? 1 : 0)) {
                    Text("Светлая").tag(0)
                    Text("Тёмная").tag(1)
                    Text("Авто").tag(2)
                }
                .pickerStyle(.segmented)
                .disabled(true)
                
                Section("Звук") {
                    HStack {
                        Text("Громкость")
                        Slider(value: $volumeLevel, in: 0...1)
                            .accentColor(.blue)
                        Text("\(Int(volumeLevel * 100))%")
                    }
                }
                
                Section("Заголовок списка") {
                    Toggle("Показывать заголовок", isOn: $showTitle)
                }
                
                Section("Высота строки") {
                    HStack {
                        Text("Высота")
                        Slider(value: $rowHeight, in: 60...120, step: 5) { edited in
                            isEditing = edited
                        }
                            .accentColor(.blue)
                        Text("\(Int(rowHeight))")
                    }
                    
                    if isEditing {
                        Text("Превью строки:")
                            .font(.headline)
                        
                        InfoRowPreview(height: rowHeight)
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
