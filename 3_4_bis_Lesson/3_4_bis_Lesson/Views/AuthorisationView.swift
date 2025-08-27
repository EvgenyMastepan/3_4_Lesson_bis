//
//  Authorisation.swift
//  3_4_bis_Lesson
//
//  Created by Evgeny Mastepan on 27.08.2025.
//

import SwiftUI

struct AuthorizationView: View {
    @EnvironmentObject var appViewModel: AppViewModel
    @StateObject private var viewModel = AuthorizationViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            let topIndent = geometry.size.height / 6
            
            ZStack {
                Color.black.ignoresSafeArea()
                
                VStack {
                    Text("Авторизация")
                        .titleTextStyle()
                        .padding(.top, topIndent)
                    
                    TextField("Email", text: $viewModel.email)
                        .commonTextFieldStyle()
                        .textContentType(.emailAddress)
                        .autocapitalization(.none)
                        .padding(.top, topIndent)
                    
                    SecureField("Пароль", text: $viewModel.password)
                        .commonTextFieldStyle()
                        .textContentType(.password)
                        .padding(.top, 20)
                    
                    if let error = viewModel.errorMessage {
                        Text(error)
                            .foregroundColor(.red)
                            .padding(.top, 10)
                    }
                    
                    Button {
                        viewModel.login { success in
                            if success {
                                appViewModel.navigateToMain()
                            }
                        }
                    } label: {
                        Text("Войти")
                    }
                    .commonButtonStyle()
                    .padding(.top, 48)
                    
                    Button {
                        appViewModel.navigateToRegistration()
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
