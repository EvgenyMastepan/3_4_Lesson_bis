//
//  AuthorisationViewModel.swift
//  3_4_bis_Lesson
//
//  Created by Evgeny Mastepan on 27.08.2025.
//

import Foundation

class AuthorizationViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String?
    
    private let authService: AuthServiceProtocol
    
    init(authService: AuthServiceProtocol = AuthService()) {
        self.authService = authService
    }
    
    // MARK: - Валидация
    func validateFields() -> Bool {
        if !Validators.isNotEmpty(email) {
            errorMessage = "Email не может быть пустым"
            return false
        }
        
        if !Validators.isValidEmail(email) {
            errorMessage = "Введите корректный email"
            return false
        }
        
        if !Validators.isNotEmpty(password) {
            errorMessage = "Пароль не может быть пустым"
            return false
        }
        
        errorMessage = nil
        return true
    }
    
    // MARK: - Авторизация
    func login(completion: @escaping (Bool) -> Void) {
        guard validateFields() else {
            completion(false)
            return
        }
        
        authService.login(email: email, password: password) { [weak self] result in
            switch result {
            case .success:
                self?.errorMessage = nil
                completion(true)
            case .failure(let error):
                self?.errorMessage = error.localizedDescription
                completion(false)
            }
        }
    }
}

