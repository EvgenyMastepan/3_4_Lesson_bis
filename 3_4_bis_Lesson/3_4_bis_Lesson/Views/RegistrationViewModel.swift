//
//  RegistrationViewModel.swift
//  3_4_bis_Lesson
//
//  Created by Evgeny Mastepan on 27.08.2025.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var errorMessage: String?
    
    private let authService: AuthServiceProtocol
    
    init(authService: AuthServiceProtocol = AuthService()) {
        self.authService = authService
    }
    
    // MARK: - Валидация отдельных полей
    func validateEmail() -> Bool {
        if !Validators.isNotEmpty(email) {
            errorMessage = "Email не может быть пустым"
            return false
        } else if !Validators.isValidEmail(email) {
            errorMessage = "Введите корректный email"
            return false
        }
        return true
    }
    
    func validatePassword() -> Bool {
        if !Validators.isNotEmpty(password) {
            errorMessage = "Пароль не может быть пустым"
            return false
        } else if !Validators.isValidPassword(password) {
            errorMessage = "Пароль должен содержать минимум 5 символов, цифру и специальный символ"
            return false
        }
        return true
    }
    
    func validateFirstName() -> Bool {
        if !Validators.isNotEmpty(firstName) {
            errorMessage = "Имя не может быть пустым"
            return false
        } else if !Validators.isValidName(firstName) {
            errorMessage = "Имя должно содержать только буквы и быть не короче 2 символов"
            return false
        }
        return true
    }
    
    func validateLastName() -> Bool {
        if !Validators.isNotEmpty(lastName) {
            errorMessage = "Фамилия не может быть пустой"
            return false
        } else if !Validators.isValidName(lastName) {
            errorMessage = "Фамилия должна содержать только буквы и быть не короче 2 символов"
            return false
        }
        return true
    }
    
    // MARK: - Полная валидация
    func validateAllFields() -> Bool {
        let validation = Validators.validateRegistration(
            email: email,
            password: password,
            firstName: firstName,
            lastName: lastName
        )
        
        if !validation.isValid {
            errorMessage = validation.errorMessage
            return false
        }
        
        errorMessage = nil
        return true
    }
    
    // MARK: - Регистрация
    func register(completion: @escaping (Bool) -> Void) {
        guard validateAllFields() else {
            completion(false)
            return
        }
        
        authService.register(
            email: email,
            password: password,
            firstName: firstName,
            lastName: lastName
        ) { [weak self] result in
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
