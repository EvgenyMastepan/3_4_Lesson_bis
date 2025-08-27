//
//  RegistrationView.swift
//  3_4_bis_Lesson
//
//  Created by Evgeny Mastepan on 27.08.2025.
//

import SwiftUI

struct RegistrationView: View {
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        GeometryReader { geometry in
                    let topIndent = geometry.size.height / 6
        ZStack {
            Color.black.ignoresSafeArea()
                // Собственно вёрстка.
                VStack {
                    Text("Регистрация")
                        .titleTextStyle()
                        .padding(.top, topIndent)
                    TextField("email", text: $viewModel.email)
                        .commonTextFieldStyle()
                        .padding(.top, topIndent)
                    SecureField("password", text: $viewModel.password)
                        .commonTextFieldStyle()
                        .padding(.top, 20)
                    TextField("Имя", text: $viewModel.firstName)
                        .commonTextFieldStyle()
                        .padding(.top, 20)
                    TextField("Фамилия", text: $viewModel.lastName)
                        .commonTextFieldStyle()
                        .padding(.top, 20)
                    
                    
                    Button {
                        viewModel.currentPage = .Main
                    } label: {
                        Text("Регистрация")
                    }
                    .commonButtonStyle()
                    .padding(.top, 48)
                        
                    Spacer()
                }
                .padding(.horizontal, 30)
            }
        }
    }
}
