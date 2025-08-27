//
//  Validators.swift
//  3_4_bis_Lesson
//
//  Created by Evgeny Mastepan on 27.08.2025.
//

import Foundation

struct Validators {
    
    // MARK: - Проверка на пустоту
    static func isNotEmpty(_ string: String) -> Bool {
        !string.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    // MARK: - Проверка email
    static func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    // MARK: - Проверка пароля
    static func isValidPassword(_ password: String) -> Bool {
        // Минимум 5 символов
        guard password.count >= 5 else { return false }
        
        // Содержит хотя бы одну цифру
        let digitRegex = ".*[0-9]+.*"
        let digitPredicate = NSPredicate(format: "SELF MATCHES %@", digitRegex)
        guard digitPredicate.evaluate(with: password) else { return false }
        
        // Содержит хотя бы один специальный символ
        let specialCharRegex = ".*[!@#$%^&*()_+\\-=\\[\\]{};':\"\\\\|,.<>\\/?]+.*"
        let specialCharPredicate = NSPredicate(format: "SELF MATCHES %@", specialCharRegex)
        guard specialCharPredicate.evaluate(with: password) else { return false }
        
        return true
    }
    
    // MARK: - Проверка имени/фамилии
    static func isValidName(_ name: String) -> Bool {
        let trimmedName = name.trimmingCharacters(in: .whitespacesAndNewlines)
        // Минимум 2 символа, только буквы
        guard trimmedName.count >= 2 else { return false }
        let lettersRegex = "^[a-zA-Zа-яА-ЯёЁ\\s]+$"
        let lettersPredicate = NSPredicate(format: "SELF MATCHES %@", lettersRegex)
        return lettersPredicate.evaluate(with: trimmedName)
    }
    
    // MARK: - Полная проверка регистрации
    static func validateRegistration(
        email: String,
        password: String,
        firstName: String,
        lastName: String
    ) -> (isValid: Bool, errorMessage: String?) {
        
        // Проверяем все поля на пустоту
        guard isNotEmpty(email) else {
            return (false, "Email не может быть пустым")
        }
        
        guard isNotEmpty(password) else {
            return (false, "Пароль не может быть пустым")
        }
        
        guard isNotEmpty(firstName) else {
            return (false, "Имя не может быть пустым")
        }
        
        guard isNotEmpty(lastName) else {
            return (false, "Фамилия не может быть пустой")
        }
        
        // Проверяем валидность email
        guard isValidEmail(email) else {
            return (false, "Введите корректный email")
        }
        
        // Проверяем сложность пароля
        guard isValidPassword(password) else {
            return (false, "Пароль должен содержать минимум 5 символов, цифру и специальный символ")
        }
        
        // Проверяем имена
        guard isValidName(firstName) else {
            return (false, "Имя должно содержать только буквы и быть не короче 2 символов")
        }
        
        guard isValidName(lastName) else {
            return (false, "Фамилия должна содержать только буквы и быть не короче 2 символов")
        }
        
        return (true, nil)
    }
}
