//
//  __4_bis_LessonApp.swift
//  3_4_bis_Lesson
//
//  Created by Evgeny Mastepan on 27.08.2025.
//

import SwiftUI

// Список экранов приложения
enum Pages {
    case Authorisation
    case Registration
    case Main
}

@main
struct __4_bis_LessonApp: App {
    // Экземпляр общего класса экранов приложения
    @StateObject var viewModel = AppViewModel()
    
    var body: some Scene {
        WindowGroup {
            
            // Переключатель экранов
            switch viewModel.currentPage {
            case .Authorisation:
                AuthorisationView()
                    .environmentObject(viewModel)
            case .Registration:
                RegistrationView()
                    .environmentObject(viewModel)
            case .Main:
                MainView()
                    .environmentObject(viewModel)
                
            }
        }
    }
}
