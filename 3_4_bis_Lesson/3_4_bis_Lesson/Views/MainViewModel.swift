//
//  MainViewModel.swift
//  3_4_bis_Lesson
//
//  Created by Evgeny Mastepan on 27.08.2025.
//

import Foundation

class MainViewModel: ObservableObject {
    @Published var user: User?
    
    func logout() {
        // Очистка данных пользователя
        user = nil
    }
    
    func loadUserData() {
        // Загрузка данных пользователя из БД
        user = User(
            email: "user@example.com",
            password: "",
            firstName: "Иван",
            lastName: "Иванов"
        )
    }
}

