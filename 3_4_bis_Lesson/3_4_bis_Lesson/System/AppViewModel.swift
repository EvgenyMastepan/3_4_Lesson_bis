//
//  AppViewModel.swift
//  3_4_bis_Lesson
//
//  Created by Evgeny Mastepan on 27.08.2025.
//

import Foundation

class AppViewModel: ObservableObject {
    @Published var currentPage: Pages = .Authorisation
    @Published var currentUser: User?
    
    // Навигация
    func navigateToMain() {
        currentPage = .Main
    }
    
    func navigateToRegistration() {
        currentPage = .Registration
    }
    
    func navigateToAuthorization() {
        currentPage = .Authorisation
    }
    
    // Сохранение данных пользователя
    func setUser(_ user: User) {
        currentUser = user
    }
    
    func clearUser() {
        currentUser = nil
    }
}
