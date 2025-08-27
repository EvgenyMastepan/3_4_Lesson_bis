//
//  AuthorisationService.swift
//  3_4_bis_Lesson
//
//  Created by Evgeny Mastepan on 27.08.2025.
//

import Foundation

protocol AuthServiceProtocol {
    func login(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void)
    func register(email: String, password: String, firstName: String, lastName: String, completion: @escaping (Result<Void, Error>) -> Void)
}

class AuthService: AuthServiceProtocol {
    func login(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void) {
        // Симуляция сетевого запроса
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            // Тут проверка на сервере.
            if email == "test@test.com" && password == "password" {
                completion(.success(()))
            } else {
                completion(.failure(NSError(domain: "AuthError", code: 401)))
            }
        }
    }
    
    func register(email: String, password: String, firstName: String, lastName: String, completion: @escaping (Result<Void, Error>) -> Void) {
        // Симуляция регистрации
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            // Запрос на сервер
            completion(.success(()))
        }
    }
}

