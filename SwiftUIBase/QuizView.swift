//
//  HelloView.swift
//  SwiftUIBase
//
//  Created by Дмитрий Дудник on 03.11.2025.
//

import SwiftUI
import Charts

struct QuizView: View {
    @EnvironmentObject var postStorage: PostStorage  // Хранилище постов
        
    @State private var currentQuestion = 0          // Текущий вопрос (0-2)
    @State private var score = 0                    // Счёт игрока
    @State private var showResult = false           // Показать экран результата
    @State private var showCorrect = false          // Подсветка правильного ответа
    @State private var showWrong = false            // Подсветка неправильного
    @State private var answerOptions: [String] = [] // 3 варианта ответа
    @State private var correctAnswer = ""           // Правильный ответ (до перемешивания)
    
    var body: some View {
        if showResult {
            resultView
                .transition(.scale)
        } else {
            questionView
                .transition(.opacity)
        }
    }
    
    // MARK: - Вопрос
    private var questionView: some View {
        VStack(spacing: 20) {
            Text("Вопрос \(currentQuestion + 1)/3")
                .font(.title2)
            
            Text(postStorage.posts[currentQuestion].title)
                .font(.title)
                .multilineTextAlignment(.center)
                .padding()
            
            if answerOptions.count == 3 {
                ForEach(0..<3) { index in
                    Button {
                        checkAnswer(index)
                    } label: {
                        Text(answerOptions[index])
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(buttonColor(for: index))
                            .foregroundColor(.primary)
                            .cornerRadius(10)
                    }
                    .disabled(showCorrect || showWrong)
                }
                .animation(.easeInOut, value: showCorrect)
                .animation(.easeInOut, value: showWrong)
            } else {
                ProgressView()
            }
            
            Spacer()
        }
        .padding()
        .animation(.easeInOut, value: currentQuestion)
        .onAppear {
            setupQuestion()
        }
    }
    
    // MARK: - Вопрос
    private func setupQuestion() {
        answerOptions = []
        
        correctAnswer = postStorage.posts[currentQuestion].description
        
        let otherPosts = postStorage.posts.enumerated().filter { $0.offset != currentQuestion }
        let wrong = otherPosts.shuffled().prefix(2).map { $0.element.description }
        
        answerOptions = [correctAnswer] + wrong
        answerOptions.shuffle()
    }
    
    // MARK: - Проверка ответа
    private func checkAnswer(_ index: Int) {
        let isCorrect = answerOptions[index] == correctAnswer
        
        if isCorrect {
            score += 1
            showCorrect = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                nextQuestion()
            }
        } else {
            showWrong = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                nextQuestion()
            }
        }
    }
    
    // MARK: - Переход к следующему вопросу
    private func nextQuestion() {
        showCorrect = false
        showWrong = false
        
        if showCorrect {
            addNewPost()
        }
        
        if currentQuestion < 2 {
            currentQuestion += 1
            setupQuestion()
        } else {
            showResult = true
        }
    }
    
    // MARK: - Цвет кнопки
    private func buttonColor(for index: Int) -> Color {
        let isCorrect = answerOptions[index] == correctAnswer
        
        if showCorrect && isCorrect {
            return .green.opacity(0.3)
        } else if showWrong && isCorrect {
            return .green.opacity(0.3)
        } else if showWrong && !isCorrect {
            return .red.opacity(0.3)
        }
        return Color.blue.opacity(0.1)
    }
    
    // MARK: - Добавление нового поста
    private func addNewPost() {
        let newPost = Post(
            title: "Новый пост #\(postStorage.posts.count + 1)",
            description: "Добавлен из викторины!",
            image: Image(systemName: "star.fill")
        )
        postStorage.addPost(newPost)
    }
    
    // MARK: - Экран результата
    private var resultView: some View {
        VStack(spacing: 30) {
            Text("Викторина завершена!")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Твой результат: \(score)/3")
                .font(.title)
            
            // ГРАФИК
            Chart {
                BarMark(
                    x: .value("Тип", "Правильные"),
                    y: .value("Количество", score)
                )
                .foregroundStyle(.green)
                
                BarMark(
                    x: .value("Тип", "Неправильные"),
                    y: .value("Количество", 3 - score)
                )
                .foregroundStyle(.red)
            }
            .frame(height: 200)
            .padding()
            
            Button("Начать заново") {
                currentQuestion = 0
                score = 0
                showResult = false
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
    }
}

#Preview {
    QuizView()
        .environmentObject(PostStorage())
}
