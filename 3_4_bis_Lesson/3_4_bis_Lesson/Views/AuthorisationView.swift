//
//  Authorisation.swift
//  3_4_bis_Lesson
//
//  Created by Evgeny Mastepan on 27.08.2025.
//

import SwiftUI

struct AuthorisationView: View {
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        GeometryReader { geometry in
                    let topIndent = geometry.size.height / 6
        ZStack {
            Color.black.ignoresSafeArea()
                // Собственно вёрстка.
                VStack {
                    Text("Авторизация")
                        .titleTextStyle()
                        .padding(.top, topIndent)
                    TextField("email", text: $viewModel.email)
                        .commonTextFieldStyle()
                        .padding(.top, topIndent)
                    SecureField("password", text: $viewModel.password)
                        .commonTextFieldStyle()
                        .padding(.top, 20)
                    Button {
                        viewModel.currentPage = .Main
                    } label: {
                        Text("Войти")
                    }
                    .commonButtonStyle()
                    .padding(.top, 48)
                    
                    Button {
                        viewModel.currentPage = .Registration
                    } label: {
                        Text("Регистрация")
                            .foregroundColor(.white)
                    }
                    .padding(.top, 40)
                        
                    Spacer()
                }
                .padding(.horizontal, 30)
            }
        }
    }
}
